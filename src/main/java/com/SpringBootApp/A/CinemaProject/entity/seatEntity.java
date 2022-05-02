package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;

@Entity
public class seatEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long seat_id;

    private boolean status;
    private int rowNum;
    private int colNum;

    @ManyToOne
    @JoinColumn(name = "showroom_id")
    private showroomEntity showroom;

    public long getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(long seat_id) {
        this.seat_id = seat_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public int getColNum() {
        return colNum;
    }

    public void setColNum(int colNum) {
        this.colNum = colNum;
    }

    public showroomEntity getShowroom() {
        return showroom;
    }

    public void setShowroom(showroomEntity showroom) {
        this.showroom = showroom;
    }
}
