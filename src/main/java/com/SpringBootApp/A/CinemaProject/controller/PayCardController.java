package com.SpringBootApp.A.CinemaProject.controller;
import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
public class PayCardController {
    @Autowired
    private userRepository userRepo;

    @Autowired
    private payCardRepository payCardRepo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/paycard/{userName}", method = RequestMethod.GET)
    public String showPayCardPage(@PathVariable("userName") String userName,Model model) {
        //model.addAttribute("userForm", new userEntity());
        model.addAttribute("payForm", new payCardEntity());
        return "paycard";
    }
    @RequestMapping(value = "/paycard/add/{userName}", method = RequestMethod.GET)
    public String showAddPayCardPage(@PathVariable("userName") String userName,Model model) {
        //model.addAttribute("userForm", new userEntity());
        model.addAttribute("payForm", new payCardEntity());
        return "paycard";
    }

    @RequestMapping(value = "/paycard/{userName}", method = RequestMethod.POST)
    public Object registerAccount(@PathVariable("userName") String userName, @ModelAttribute("payForm") payCardEntity payForm, BindingResult bindingResult)
            throws IOException, MessagingException {
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        userEntity accountInstance = userRepo.findByUserName(userName);

        payForm.setCardType(payForm.getCardType());
        payForm.setCardNumber(bCryptPasswordEncoder.encode(payForm.getCardNumber()));
        payForm.setExpDate(payForm.getExpDate());
        payForm.setUser(accountInstance);
        Set<payCardEntity> payCards = new HashSet<>();
        payCards.add(payForm);
        accountInstance.setPayCards(payCards);

        userRepo.save(accountInstance);

        return "redirect:/regconf";
    }
    @RequestMapping(value = "/paycard/add/{userName}", method = RequestMethod.POST)
    public Object addPayCard(@PathVariable("userName") String userName, @ModelAttribute("payForm") payCardEntity payForm, BindingResult bindingResult)
            throws IOException, MessagingException {
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        userEntity accountInstance = userRepo.findByUserName(userName);

        payForm.setCardType(payForm.getCardType());
        payForm.setCardNumber(bCryptPasswordEncoder.encode(payForm.getCardNumber()));
        payForm.setExpDate(payForm.getExpDate());
        payForm.setUser(accountInstance);
        Set<payCardEntity> payCards = new HashSet<>();
        payCards.add(payForm);
        accountInstance.setPayCards(payCards);

        userRepo.save(accountInstance);

        return "redirect:/managePayCards/"+accountInstance.getUserName();
    }
}
