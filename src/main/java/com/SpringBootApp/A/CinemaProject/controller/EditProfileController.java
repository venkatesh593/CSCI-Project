package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
public class EditProfileController {
    @Autowired
    private userRepository userRepo;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;



    @RequestMapping(value = "editprofile/{userName}", method = RequestMethod.GET)
    public String showEditProfilePage(@PathVariable("userName") String userName, Model model, userEntity userForm) {
        userEntity loggedUser = userRepo.findByUserName(userName);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("userForm", new userEntity());


        return "editprofile";
    }

    @RequestMapping(value = "editprofile/{userName}", method = RequestMethod.POST)
    public String sendEditProfilePage(@ModelAttribute("userForm") userEntity userForm, Model model,
                                      @PathVariable("userName") String userName) {
        userEntity accountInstance = userRepo.findByEmail(userForm.getEmail());

        accountInstance.setFirstName(userForm.getFirstName());
        accountInstance.setLastName(userForm.getLastName());
        accountInstance.setUserName(userForm.getUserName());
        // Email cannot be changed
        if(bCryptPasswordEncoder.matches(userForm.getPassConf(), accountInstance.getPassword())) {
            accountInstance.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));
        }
        accountInstance.setPhoneNumber(userForm.getPhoneNumber());
        accountInstance.setStreet(userForm.getStreet());
        accountInstance.setCity(userForm.getCity());
        accountInstance.setState(userForm.getState());
        accountInstance.setZipCode(userForm.getZipCode());
        accountInstance.setWantsPromotions(userForm.getWantsPromotions());

        userRepo.save(accountInstance);

        return "redirect:/editprofile/" + userForm.getUserName();
    }
}