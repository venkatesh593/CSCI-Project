package com.SpringBootApp.A.CinemaProject.entity;

public enum ticketType {
    ADULT(10.00f),
    CHILD(7.50f);

    ticketType(float price) {
        this.price = price;
    }

    public float price;


}
