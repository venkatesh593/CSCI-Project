package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;

@Entity
@Table(name="tickets")
public class ticketEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long ticket_id;

    private ticketType age = ticketType.ADULT;

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

    public ticketType getAge() {
        return age;
    }

    public void setAge(ticketType age) {
        this.age = age;
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
