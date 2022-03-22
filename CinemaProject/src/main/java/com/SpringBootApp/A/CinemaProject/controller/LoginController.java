package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @Autowired
    private userRepository userRepo;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        model.addAttribute("login", new userEntity());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object submitLoginIn(@ModelAttribute("login") userEntity userForm, Model model) {

        userEntity userInstance = userRepo.findByUserName(userForm.getUserName());

        if (userInstance == null || !(userInstance.getPassword().matches(userForm.getPassword()))) {
            System.out.println("Username / Password does not exist");
            System.out.println(userInstance);
            return "login";
        }
        if (!(userInstance == null || !(userInstance.getPassword().matches(userForm.getPassword())))) {
            System.out.println("The user exists");
            return "login";
        }
        return null;
    }
}
