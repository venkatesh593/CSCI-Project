package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
//import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Controller
public class GalleryController {

    @Autowired
    private movieRepository movieRepo;

    //private SecurityService securityService;

    @RequestMapping(value = "/moviegallery", method = RequestMethod.GET)
    public String showGalleryPage(ModelMap model) {
        model.addAttribute("searchMovies", movieRepo.findAll());
        model.addAttribute("title", new movieEntity());
        return "moviegallery";
    }

    @RequestMapping(value = "/moviegallery/{movieTitle}", method = RequestMethod.GET)
    public String showSearchPage(@PathVariable("movieTitle") String title, ModelMap model) {
        model.addAttribute("searchMovies", movieRepo.findAllByTitle(title));
        model.addAttribute("title", new movieEntity());
        if (movieRepo.findAllByTitle(title).isEmpty())
            model.addAttribute("error", "This movie does not exist");
        return "moviegallery";
    }

    @RequestMapping(value = "/moviegallery", method = RequestMethod.POST)
    public Object searchMovies( @ModelAttribute("title") String title, BindingResult bindingResult)
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }


        return "redirect:/moviegallery/"+title;
    }

    @RequestMapping(value = "/moviegallery/{movieTitle}", method = RequestMethod.POST)
    public Object searchMoviesAgain( @ModelAttribute("title") String title, BindingResult bindingResult)
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }


        return "redirect:/moviegallery/"+title;
    }
}