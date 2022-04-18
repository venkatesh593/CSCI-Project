package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShowTimesController {
    @Autowired
    private movieRepository movieRepo;

    @RequestMapping(value = "/showTimes/{movieTitle}", method = RequestMethod.GET)
    public String showTimesPage(@PathVariable("movieTitle") String title, ModelMap model) {
        model.addAttribute("timesForm", movieRepo.findByTitle(title));
        return "showTimes";
    }


}
