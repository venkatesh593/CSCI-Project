package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.*;
import com.SpringBootApp.A.CinemaProject.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Controller
public class selectSeatsController {

    @Autowired
    private showRepository showRepo;

    @Autowired
    private seatRepository seatRepo;

    @Autowired
    private orderRepository orderRepo;

    @Autowired
    private ticketRepository ticketRepo;

    @Autowired
    private showroomRepository showroomRepo;

    @RequestMapping(value = "/selectseats/{show_id}", method = RequestMethod.GET)
    public String showTimesPage(@PathVariable("show_id") Long id, ModelMap model) {
        Optional<showEntity> show = showRepo.findById(id);
        if(show.isPresent()) {
            model.addAttribute("bookingForm", show.get());
            model.addAttribute("showroom", show.get().getShowroom());

        }
        return "selectseats";
    }

    @RequestMapping(value = "/selectseats/{show_id}", method = RequestMethod.POST)
    public String saveTickets(@ModelAttribute("bookingForm") showEntity bookingForm, Model model) throws Exception{
        Optional<showEntity> newShow = showRepo.findById(bookingForm.getShow_id());
        showroomEntity showroom = bookingForm.getShowroom();
        if(newShow.isPresent()) {
            orderEntity order = new orderEntity();
            order.setShow(newShow.get());
            orderRepo.save(order);

            for(int i = 0; i < newShow.get().getShowroom().getSeats().size(); i++) {
                newShow.get().getShowroom().getSeats().get(i).setStatus(showroom.getSeats().get(i).isStatus());
                seatRepo.save(newShow.get().getShowroom().getSeats().get(i));
                if(newShow.get().getShowroom().getSeats().get(i).isStatus()) {
                    ticketEntity ticket = new ticketEntity();
                    ticket.setSeat(newShow.get().getShowroom().getSeats().get(i));
                    ticket.setOrder(order);
                    ticketRepo.save(ticket);
                    order.getTickets().add(ticket);
                    order.setNumTickets(order.getNumTickets() + 1);
                }
            }
            order.setTotalPrice(order.getNumTickets() * ticketType.ADULT.price);
            orderRepo.save(order);
            showroomRepo.save(newShow.get().getShowroom());
            return "redirect:/ordersummary/"+ order.getOrder_id();
        } else {
            return "redirect:/home";
        }
    }
}
