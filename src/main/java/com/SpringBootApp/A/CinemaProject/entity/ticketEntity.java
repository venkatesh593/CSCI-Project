package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;

@Entity
@Table(name="tickets")
public class ticketEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long ticket_id;

    private String age;

    private long price;

    @OneToOne
    @JoinColumn(name = "seat_id")
    private seatEntity seat;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private orderEntity order;

    public long getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(long ticket_id) {
        this.ticket_id = ticket_id;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public seatEntity getSeat() {
        return seat;
    }

    public void setSeat(seatEntity seat) {
        this.seat = seat;
    }

    public orderEntity getOrder() {
        return order;
    }

    public void setOrder(orderEntity order) {
        this.order = order;
    }
}
