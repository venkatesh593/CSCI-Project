package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.ticketType;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import com.SpringBootApp.A.CinemaProject.repository.payCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CheckoutController {

    @Autowired
    orderRepository orderRepo;

    @Autowired
    payCardRepository payCardRepo;


    @RequestMapping(value = "checkout/{order_id}", method = RequestMethod.GET)
    public String showCheckout(@PathVariable("order_id") long order_id, Model model, payCardEntity payCardForm) {
        orderEntity order = orderRepo.findById(order_id);
        model.addAttribute("order", order);
        model.addAttribute("payCardForm", new payCardEntity());

        return "checkout";
    }

    @RequestMapping(value = "checkout/{order_id}", method = RequestMethod.POST)
    public String sendCheckoutSummary(@ModelAttribute("payCardForm") payCardEntity payCardForm, Model model,
                                   @PathVariable("order_id") long order_id) {
        orderEntity orderInstance = orderRepo.findById(order_id);
        payCardForm.setCardNumber(payCardForm.getCardNumber());
        payCardForm.setCardType(payCardForm.getCardType());
        payCardForm.setExpDate(payCardForm.getExpDate());
        payCardForm.setCvv(payCardForm.getCvv());
        payCardForm.setUser(orderInstance.getUser());
        payCardRepo.save(payCardForm);

        orderInstance.setPayCard(payCardForm);
        orderRepo.save(orderInstance);

        return "redirect:/orderconfirmation/"+order_id;
    }

}
