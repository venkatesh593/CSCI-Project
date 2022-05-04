package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

@Controller
public class OrderConfirmationController {

    @Autowired
    orderRepository orderRepo;
    @Autowired
    payCardRepository payCardRepo;
    @Autowired
    userRepository userRepo;

    @RequestMapping(value = "orderconfirmation/{order_id}/{payCard_id}", method = RequestMethod.GET)
    public String showOrderConfirmation(@PathVariable("order_id") long order_id,
                                        @PathVariable("payCard_id") long payCard_id, Model model) throws IOException, MessagingException {

        orderEntity order = orderRepo.findById(order_id);
        order.setPayCard(payCardRepo.findById(payCard_id));
        orderRepo.save(order);
        model.addAttribute("order", order);
        userEntity accountinstance = userRepo.findById(order.getUser().getUser_id());
        sendmail(accountinstance.getEmail());

        return "orderconfirmation";
    }

    private void sendmail(String emailRecipient) throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("cinemaregconf@gmail.com", "HotStuffSecure1!");
            }
        });
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("cinemaregconf@gmail.com", false));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailRecipient));
        msg.setSubject("Order Confirmation Email");
        msg.setContent("Hello, \n\nThank you for booking tickets with our cinema e-booking system!\n\nYour order has been processed.", "text/html");
        msg.setSentDate(new Date());

        Transport.send(msg);
    }
}

