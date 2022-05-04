package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderHistoryController {
    @Autowired
    private orderRepository orderRepo;
    @Autowired
    private userRepository userRepo;

    @RequestMapping(value = "/orderHistory/{userName}", method = RequestMethod.GET)
    public String showOrderHistory(@PathVariable("userName") String userName, ModelMap model, String error) {
        userEntity accountInstance = userRepo.findByUserName(userName);
        model.addAttribute("orders", orderRepo.findAllByUser(accountInstance));

        return "/orderHistory";
    }
}
