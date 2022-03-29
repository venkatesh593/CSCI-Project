package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

@Controller
public class ForgotPasswordController {

    @Autowired
    userRepository userRepo;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
    public String showForgotPasswordPage(ModelMap model, String error) {
        model.addAttribute("email", new userEntity());

        if (error != null)
            model.addAttribute("error", "This email does not exist.");

        return "forgotpassword";
    }

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
    public Object submit(@ModelAttribute("email") String forgotEmail, BindingResult bindingResult)
            throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        userEntity user = userRepo.findByEmail(forgotEmail);
        if(user != null) {
            String tempPass = getRandomPassword();
            user.setPassword(bCryptPasswordEncoder.encode(tempPass));
            userRepo.save(user);
            sendmail(forgotEmail, tempPass);
            return "redirect:/login?forgot";
        } else {
            return "/forgotpassword?error";
        }

//$2a$10$.Fi5wc/7BBZGKOdP91NeXOCABFCWPdS.NQXEyGnFXt2TMJYcpKXju
    }

    protected String getRandomPassword() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 11) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }

    private void sendmail(String emailRecipient, String randomPassword) throws AddressException, MessagingException, IOException {
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
        msg.setContent("Hello, \n\nI'm sorry you've forgotten your password. We have sent you a temporary password" +
                " in hopes that you are able to recover it.\n\nYour temporary password is: " +randomPassword, "text/html");
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
