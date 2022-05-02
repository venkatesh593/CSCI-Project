package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.showRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.swing.text.html.Option;
import java.util.Optional;

@Controller
public class selectSeatsController {

    @Autowired
    private showRepository showRepo;

    @RequestMapping(value = "/selectseats/{show_id}", method = RequestMethod.GET)
    public String showTimesPage(@PathVariable("show_id") Long id, ModelMap model) {
        Optional<showEntity> show = showRepo.findById(id);
        if(show.isPresent()) {
            model.addAttribute("bookingForm", show.get());
        }
        return "selectseats";
    }
}
