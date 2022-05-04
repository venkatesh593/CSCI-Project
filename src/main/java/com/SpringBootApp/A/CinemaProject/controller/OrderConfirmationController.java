package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderConfirmationController {

    @Autowired
    orderRepository orderRepo;

    @RequestMapping(value = "orderconfirmation/{order_id}", method = RequestMethod.GET)
    public String showOrderConfirmation(@PathVariable("order_id") long order_id, Model model) {
        orderEntity order = orderRepo.findById(order_id);
        model.addAttribute("order", order);

        return "orderconfirmation";
    }
}
