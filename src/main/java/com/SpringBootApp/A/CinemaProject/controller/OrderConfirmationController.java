package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
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
    @Autowired
    payCardRepository payCardRepo;

    @RequestMapping(value = "orderconfirmation/{order_id}/{payCard_id}", method = RequestMethod.GET)
    public String showOrderConfirmation(@PathVariable("order_id") long order_id,
                                        @PathVariable("payCard_id") long payCard_id, Model model) {

        orderEntity order = orderRepo.findById(order_id);
        order.setPayCard(payCardRepo.findById(payCard_id));
        orderRepo.save(order);
        model.addAttribute("order", order);

        return "orderconfirmation";
    }
}
