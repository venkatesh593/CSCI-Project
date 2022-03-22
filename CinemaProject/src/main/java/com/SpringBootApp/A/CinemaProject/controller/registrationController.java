package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class registrationController {
    @Autowired
    private userRepository userRepo;

    public registrationController(userRepository userRepo) {
        this.userRepo = userRepo;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String showRegPage(Model model) {
        model.addAttribute("userForm", new userEntity());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("userForm") userEntity userForm, BindingResult bindingResult,
                                  Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        userForm.setFirstName(userForm.getFirstName());
        userForm.setLastName(userForm.getLastName());
        userForm.setEmail(userForm.getEmail().toLowerCase());
        userForm.setPhoneNumber(userForm.getPhoneNumber());
        userForm.setUserName(userForm.getUserName());
        userForm.setPassword(userForm.getPassword());
        userForm.setBillingAddress(userForm.getBillingAddress());

        userRepo.save(userForm);

        return "regconf";
    }
}
