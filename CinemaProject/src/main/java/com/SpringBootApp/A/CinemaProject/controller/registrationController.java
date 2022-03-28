package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;

@Controller
public class registrationController {
    @Autowired
    private userRepository userRepo;

    public registrationController(userRepository userRepo) {
        this.userRepo = userRepo;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String showRegPage(Model model) {
        model.addAttribute("userForm", new userEntity());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("userForm") userEntity userForm, BindingResult bindingResult,
                                  Model model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }



        // Mandatory
        userForm.setFirstName(userForm.getFirstName());
        userForm.setLastName(userForm.getLastName());
        userForm.setEmail(userForm.getEmail().toLowerCase());
        userForm.setPhoneNumber(userForm.getPhoneNumber());
        userForm.setUserName(userForm.getUserName());
        userForm.setPassword(userForm.getPassword());

        String verCode = getSaltString();
        userForm.setVerCode(verCode);

        // Optional
        userForm.setStreet(userForm.getStreet());
        userForm.setCity(userForm.getCity());
        userForm.setState(userForm.getState());
        userForm.setZipCode(userForm.getZipCode());

        // Opt-in Promotions
        userForm.setWantsPromotions(userForm.getWantsPromotions());

        // Confirmation Email
        sendmail(userForm.getEmail().toLowerCase(), verCode);

        userRepo.save(userForm);

        return "regconf";
    }

    @RequestMapping(value = "/regconf", method = RequestMethod.GET)
    public String showRegConfPage(Model model) {
        model.addAttribute("regconf", new userEntity());
        return "regconf";
    }

    @RequestMapping(value = "/regconf", method = RequestMethod.POST)
    public Object submitConfCode(@ModelAttribute("regconf") userEntity userForm, Model model) {

        userEntity userInstance = userRepo.findByVerCode(userForm.getVerCode());

        if (userInstance == null || !(userInstance.getVerCode().matches(userForm.getVerCode()))) {
            System.out.println("Incorrect Verification Code");
            System.out.println(userInstance);
            return "regconf";
        }
        if (!(userInstance == null || !(userInstance.getVerCode().matches(userForm.getVerCode())))) {
            userInstance.setUserStatus("ACTIVE");
            userRepo.save(userInstance);
            System.out.println("Customer Account is now active");
            return "login";
        }

        return "regconf";
    }

    protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }

    private void sendmail(String emailRecipient, String verCode) throws AddressException, MessagingException, IOException {
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
        msg.setContent("Hello, \n\nThank you for registering to our cinema e-booking system!\n\nYour verification code is: "+verCode, "text/html");
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
