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

    @RequestMapping(value = "editpaycard/{payCard_id}", method = RequestMethod.GET)
    public String showEditPayCardPage(@PathVariable("payCard_id") long payCard_id, Model model, userEntity userForm) {
        payCardEntity currentCard = payCardRepo.findById(payCard_id);
        model.addAttribute("currentCard", currentCard);
        model.addAttribute("payForm", new payCardEntity());

        return "editpaycard";
    }
    @RequestMapping(value = "editpaycard/{payCard_id}", method = RequestMethod.POST)
    public String sendEditPayCardPage(Model model,
                                      @PathVariable("payCard_id") long payCard_id,
                                      @ModelAttribute("payForm") payCardEntity payForm) {
        userEntity accountInstance = userRepo.findByUserName(securityService.findLoggedInUsername());
        payCardEntity cardInstance = payCardRepo.findById(payCard_id);

        cardInstance.setCardType(payForm.getCardType());
        cardInstance.setCardNumber(payForm.getCardNumber());
        if( !(payForm.getCardNumber().equals("")) && !(bCryptPasswordEncoder.matches(payForm.getCardNumber(), cardInstance.getCardNumber())) ) {
            cardInstance.setCardNumber(bCryptPasswordEncoder.encode(payForm.getCardNumber()));
        }
        cardInstance.setExpDate(payForm.getExpDate());
        cardInstance.setCvv(payForm.getCvv());

        payCardRepo.save(cardInstance);

        return "redirect:/managePayCards/" + accountInstance.getUserName();
    }
}
