package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.showRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import java.io.IOException;

@Controller
public class MovieInfoController {
    @Autowired
    private movieRepository movieRepo;

    @Autowired
    private showRepository showRepo;

    @RequestMapping(value = "/movieinfo/{movieTitle}", method = RequestMethod.GET)
    public String showMovieInfoPage(@PathVariable("movieTitle") String title, ModelMap model) {
        model.addAttribute("browseMovie", movieRepo.findByTitle(title));
        return "movieinfo";
    }

    @RequestMapping(value = "/movieinfo/{movieTitle}", method = RequestMethod.POST)
    public Object searchMoviesAgain(@PathVariable("movieTitle") String title, BindingResult bindingResult)
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }


        return "redirect:/moviegallery/"+title;
    }
}
