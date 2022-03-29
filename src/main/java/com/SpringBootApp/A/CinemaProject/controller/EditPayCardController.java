package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
public class EditPayCardController {
    @Autowired
    private userRepository userRepo;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private payCardRepository payCardRepo;

    @RequestMapping(value = "editpaycard/{userName}", method = RequestMethod.GET)
    public String showEditPayCardPage(@PathVariable("userName") String userName, Model model, userEntity userForm) {
        userEntity loggedUser = userRepo.findByUserName(userName);
        payCardEntity currentCard = payCardRepo.findByUser(loggedUser);
        //System.out.println(loggedUser.getUserName());
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("currentCard", currentCard);
        model.addAttribute("payForm", new payCardEntity());
        model.addAttribute("userForm", new userEntity());


        return "editpaycard";
    }
    @RequestMapping(value = "editpaycard/{userName}", method = RequestMethod.POST)
    public String sendEditPayCardPage(@ModelAttribute("userForm") userEntity userForm, Model model,
                                      @PathVariable("userName") String userName,
                                      @ModelAttribute("payForm") payCardEntity payForm) {
        userEntity accountInstance = userRepo.findByUserName(securityService.findLoggedInUsername());
        payCardEntity cardInstance = payCardRepo.findByUser(accountInstance);

        cardInstance.setCardType(payForm.getCardType());
        cardInstance.setCardNumber(payForm.getCardNumber());
        if( !(payForm.getCardNumber().equals("")) && !(bCryptPasswordEncoder.matches(payForm.getCardNumber(), cardInstance.getCardNumber())) ) {
            cardInstance.setCardNumber(bCryptPasswordEncoder.encode(payForm.getCardNumber()));
        }
        cardInstance.setExpDate(payForm.getExpDate());
        cardInstance.setCvv(payForm.getCvv());

        payCardRepo.save(cardInstance);

        return "redirect:/editprofile/" + accountInstance.getUserName();
    }
}
