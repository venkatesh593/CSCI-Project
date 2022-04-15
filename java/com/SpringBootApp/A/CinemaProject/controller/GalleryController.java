package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
//import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GalleryController {

    @Autowired
    private userRepository userRepo;

    //private SecurityService securityService;

    @RequestMapping(value = "/moviegallery", method = RequestMethod.GET)
    public String showGalleryPage(ModelMap model) {
        model.addAttribute("login", new userEntity());
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getDetails());
        return "moviegallery";
    }


}