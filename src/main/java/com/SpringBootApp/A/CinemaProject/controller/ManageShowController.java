package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.showRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageShowController {
    @Autowired
    private movieRepository movieRepo;

    @Autowired
    private showRepository showRepo;

    @RequestMapping(value = "/manageShow", method = RequestMethod.GET)
    public String showManageShow(ModelMap model, String error) {
        model.addAttribute("shows", showRepo.findAll());

        return "/manageShow";
    }

    @RequestMapping(value = "/movieSelect", method = RequestMethod.GET)
    public String showMovieSelect(ModelMap model, String error) {
        model.addAttribute("movies", movieRepo.findAll());

        if (error != null)
            model.addAttribute("error", "This Show conflicts with another please try again.");

        return "/movieSelect";
    }

}