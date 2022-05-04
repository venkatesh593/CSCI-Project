package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="orders")
public class orderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long order_id;

    private float totalPrice;

    private int numTickets;

    @OneToOne
    @JoinColumn(name = "promo_id")
    private promoEntity promo;

    @OneToOne
    @JoinColumn(name = "payCard_id")
    private payCardEntity payCard;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private userEntity user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private Set<ticketEntity> tickets = new HashSet<>();

    public long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(long order_id) {
        this.order_id = order_id;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getNumTickets() {
        return numTickets;
    }

    public void setNumTickets(int numTickets) {
        this.numTickets = numTickets;
    }

    public promoEntity getPromo() {
        return promo;
    }

    public void setPromo(promoEntity promo) {
        this.promo = promo;
    }

    public payCardEntity getPayCard() {
        return payCard;
    }

    public void setPayCard(payCardEntity payCard) {
        this.payCard = payCard;
    }

    public userEntity getUser() {
        return user;
    }

    public void setUser(userEntity user) {
        this.user = user;
    }

    public Set<ticketEntity> getTickets() {
        return tickets;
    }

    public void setTickets(Set<ticketEntity> tickets) {
        this.tickets = tickets;
    }
}
