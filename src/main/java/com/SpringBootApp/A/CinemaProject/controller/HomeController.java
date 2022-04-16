package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    @Autowired
    private movieRepository movieRepo;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showManageMovies(ModelMap model, String error) {
        model.addAttribute("playingMovies", movieRepo.findAllPlayingMovies());
        model.addAttribute("upcomingMovies", movieRepo.findAllUpcomingMovies());

        return "/home";
    }
}

