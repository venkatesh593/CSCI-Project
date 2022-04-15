package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.promoEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.promotionRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

@Controller
public class PromotionsController {
    @Autowired
    private promotionRepository promoRepo;

    @Autowired
    private userRepository userRepo;

    @RequestMapping(value = "/managePromotions", method = RequestMethod.GET)
    public String showManagePromotions(ModelMap model, String error) {
        model.addAttribute("promos", promoRepo.findAll());

        return "/managePromotions";
    }

    @RequestMapping(value = "/addPromotion", method = RequestMethod.GET)
    public String showAddPromotion(ModelMap model, String error) {
        model.addAttribute("promoForm", new promoEntity());
        return "/addPromotion";
    }

    @RequestMapping(value = "/addPromotion", method = RequestMethod.POST)
    public Object addPromotion(@ModelAttribute("promoForm") promoEntity promoForm, BindingResult bindingResult)
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        promoForm.setPromoName(promoForm.getPromoName());
        promoForm.setPromoAmt(promoForm.getPromoAmt());
        promoForm.setPromoCode(promoForm.getPromoCode());
        promoForm.setExpDate(promoForm.getExpDate());

        promoRepo.save(promoForm);

        userEntity[] users = userRepo.findAllByWantsPromotions("true");

        for(userEntity user : users) {
            sendmail(user.getEmail(), promoForm.getPromoCode(), promoForm.getPromoAmt());
        }

        return "redirect:/managePromotions";
    }

    private void sendmail(String emailRecipient, String promoCode, String promoAmt) throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("cinemaregconf@gmail.com", "HotStuffSecure1!");
            }
        });
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("cinemaregconf@gmail.com", false));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailRecipient));
        msg.setSubject("Registration Confirmation Email");
        msg.setContent("Hello, \n\nWe are pleased to announce that we have created a new promotion! \n\nThis promotion is a code for " + promoAmt +
                " off your purchases! \n\n To redeem this code please use the code: " +
                promoCode + " at checkout.", "text/html");
        msg.setSentDate(new Date());
        /*
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent("Tutorials point email", "text/html");
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        MimeBodyPart attachPart = new MimeBodyPart();
        attachPart.attachFile("/var/tmp/image19.png");
        multipart.addBodyPart(attachPart);
        msg.setContent(multipart);
        */
        Transport.send(msg);
    }

}