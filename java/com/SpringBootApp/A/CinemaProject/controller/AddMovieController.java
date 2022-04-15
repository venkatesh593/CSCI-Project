package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.showRepository;
import com.SpringBootApp.A.CinemaProject.repository.userRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

@Controller
public class AddMovieController {
    @Autowired
    private movieRepository movieRepo;

    @Autowired
    private showRepository showRepo;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/addMovie", method = RequestMethod.GET)
    public String showManageMovies(ModelMap model, String error) {
        model.addAttribute("movieForm", new movieEntity());
        return "/addMovie";
    }

    @RequestMapping(value = "/addMovie", method = RequestMethod.POST)
    public Object addMovie(@ModelAttribute("movieForm") movieEntity movieForm, BindingResult bindingResult)
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        movieForm.setTitle(movieForm.getTitle());
        movieForm.setCast(movieForm.getCast());
        movieForm.setCategory(movieForm.getCategory());
        movieForm.setSynopsis(movieForm.getSynopsis());
        movieForm.setDirector(movieForm.getDirector());
        movieForm.setDuration(movieForm.getDuration());
        movieForm.setFilmRating(movieForm.getFilmRating());
        movieForm.setProducer(movieForm.getProducer());
        movieForm.setReviews(movieForm.getReviews());
        movieForm.setTrailerPicture(movieForm.getTrailerPicture());
        movieForm.setTrailerVideo(movieForm.getTrailerVideo());

        movieRepo.save(movieForm);

        return "redirect:/addShow/" + movieForm.getTitle();
    }
}