package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
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
public class LoginController {
    @Autowired
    private userRepository userRepo;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model, String error,
                                @RequestParam(value = "logout", required=false) String logout,
                                @RequestParam(value = "forgot", required=false) String forgot) {
        model.addAttribute("login", new userEntity());
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");
        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        if (forgot != null)
            model.addAttribute("reset", "A temporary password has been sent to your email");
        System.out.println("Loaded properly");
        return "login";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object submitLoginIn(@ModelAttribute("login") userEntity userForm, Model model) {
        userEntity userInstance = userRepo.findByUserName(userForm.getUserName());

        return securityService.Login(userForm.getUserName(), userForm.getPassword());
    }
}