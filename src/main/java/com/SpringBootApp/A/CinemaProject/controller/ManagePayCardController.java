package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagePayCardController {
    @Autowired
    private payCardRepository payCardRepo;

    @RequestMapping(value = "/managePayCards", method = RequestMethod.GET)
    public String showManagePayCards(ModelMap model, String error) {
        model.addAttribute("payCards", payCardRepo.findAllByUser());

        return "/manageMovies";
    }
}
