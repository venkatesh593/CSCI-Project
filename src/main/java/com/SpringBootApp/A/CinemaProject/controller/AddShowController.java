package com.SpringBootApp.A.CinemaProject.controller;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.seatEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import com.SpringBootApp.A.CinemaProject.entity.showroomEntity;
import com.SpringBootApp.A.CinemaProject.repository.movieRepository;
import com.SpringBootApp.A.CinemaProject.repository.seatRepository;
import com.SpringBootApp.A.CinemaProject.repository.showRepository;
import com.SpringBootApp.A.CinemaProject.repository.showroomRepository;
import com.SpringBootApp.A.CinemaProject.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class AddShowController {
    @Autowired
    private movieRepository movieRepo;

    @Autowired
    private showRepository showRepo;

    @Autowired
    private showroomRepository showroomRepo;

    @Autowired
    private seatRepository seatRepo;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/addShow/{movieTitle}", method = RequestMethod.GET)
    public String showAddShow(@PathVariable("movieTitle") String movieTitle, ModelMap model, String error) {
        model.addAttribute("showForm", new showEntity());
        return "/addShow";
    }

    @RequestMapping(value = "/addShow/{movieTitle}", method = RequestMethod.POST)
    public Object addShow(@PathVariable("movieTitle") String movieTitle,
                          @ModelAttribute("showForm") showEntity showForm, BindingResult bindingResult
                          // @RequestParam("localDate")
                           //@DateTimeFormat(pattern = "dd.MM.yyyy") LocalDate localDate,
                           //@RequestParam("localTime")
                           //@DateTimeFormat(pattern = "HH:mm:ss") LocalTime localTime
    )
            throws IOException, MessagingException {
        if(bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        if(!showRepo.existsByLocalDateAndLocalTime(showForm.getLocalDate(), showForm.getLocalTime())) {
            movieEntity movieInstance = movieRepo.findByTitle(movieTitle);

            System.out.println(showForm.getLocalDate());
            System.out.println(showForm.getLocalTime());
            System.out.println(movieInstance);

            showroomEntity showroom = new showroomEntity();
            showroom.setNumCols(5);
            showroom.setNumRows(5);
            showroom.setCapacity(25);
            List<seatEntity> seats = new ArrayList<seatEntity>();
            showroom.setSeats(seats);
            showroomRepo.save(showroom);

            System.out.println(showroom.getNumRows());
            for(int i = 0; i < showroom.getNumRows(); i++) {
                for(int j = 0; j < showroom.getNumCols(); j++) {
                    System.out.println("5");
                    seatEntity seat = new seatEntity();
                    seat.setRowNum(i);
                    seat.setColNum(j);
                    seat.setShowroom(showroom);
                    seat.setStatus(false);
                    seats.add(seat);
                    seatRepo.save(seat);
                }
            }
            showroomRepo.save(showroom);

            showForm.setShowroom(showroom);
            showForm.setMovie(movieInstance);
            showForm.setLocalDate(showForm.getLocalDate());
            showForm.setLocalTime(showForm.getLocalTime());
            Set<showEntity> shows = new HashSet<>();
            shows.add(showForm);
            movieInstance.setShows(shows);

            movieRepo.save(movieInstance);

            return "redirect:/manageShow";
        } else {
            return "redirect:/movieSelect?error";
        }
    }
}
