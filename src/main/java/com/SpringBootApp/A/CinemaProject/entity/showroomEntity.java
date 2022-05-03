package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Showrooms")
public class showroomEntity {

    //Defining showroom entity information
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long showroom_id;

    private int numRows;
    private int numCols;

    @OneToMany(mappedBy = "showroom", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    List<seatEntity> seats;

    private int capacity;

    //Getters and Setters

    public long getShowroom_id() {
        return showroom_id;
    }

    public void setShowroom_id(long showroom_id) {
        this.showroom_id = showroom_id;
    }

    public int getNumRows() {
        return numRows;
    }

    public void setNumRows(int numRows) {
        this.numRows = numRows;
    }

    public int getNumCols() {
        return numCols;
    }

    public void setNumCols(int numCols) {
        this.numCols = numCols;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public List<seatEntity> getSeats() {
        return seats;
    }

    public void setSeats(List<seatEntity> seats) {
        this.seats = seats;
    }
}
