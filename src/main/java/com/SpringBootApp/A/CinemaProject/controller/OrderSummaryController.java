package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.promoEntity;
import com.SpringBootApp.A.CinemaProject.entity.ticketType;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.orderRepository;
import com.SpringBootApp.A.CinemaProject.repository.promotionRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Optional;

@Controller
public class OrderSummaryController {
    @Autowired
    private orderRepository orderRepo;
    @Autowired
    private userRepository userRepo;
    @Autowired
    private promotionRepository promoRepo;

    @Autowired
    private SecurityService securityService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @RequestMapping(value = "ordersummary/{order_id}", method = RequestMethod.GET)
    public String showOrderSummary(@PathVariable("order_id") long order_id, Model model, orderEntity orderForm) {
        orderEntity order = orderRepo.findById(order_id);
        model.addAttribute("order", order);
        model.addAttribute("orderForm", new orderEntity());

        return "ordersummary";
    }

    @RequestMapping(value = "ordersummary/{order_id}", method = RequestMethod.POST)
    public String sendOrderSummary(@ModelAttribute("orderForm") orderEntity orderForm, Model model,
                                   @PathVariable("order_id") long order_id) {
        orderEntity orderInstance = orderRepo.findById(order_id);
        orderInstance.setCustomerUserName(orderForm.getCustomerUserName());
        orderInstance.setUser(userRepo.findByUserName(orderForm.getCustomerUserName()));
        orderInstance.setPromo(promoRepo.findByPromoCode(orderForm.getPromoCode()));
        orderInstance.setAdults(orderForm.getAdults());
        orderInstance.setChildren(orderForm.getChildren());
        float total = ((orderInstance.getChildren()* ticketType.CHILD.price)
                + (orderInstance.getAdults() * ticketType.ADULT.price));
        if(orderInstance.getPromo() != null) {
            total = total - (total * orderInstance.getPromo().getPromoAmt());
        }
        orderInstance.setNumTickets(orderForm.getChildren() + orderForm.getAdults());
        orderInstance.setTotalPrice(total);

        orderRepo.save(orderInstance);
        return "redirect:/checkout/"+orderInstance.getOrder_id();
    }


}
