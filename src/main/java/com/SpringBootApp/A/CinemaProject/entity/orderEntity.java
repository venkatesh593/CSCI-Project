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

    private String customerUserName;

    private float totalPrice;

    private int numTickets;

    private int children = 0;

    private int adults = 0;

    @OneToOne
    @JoinColumn(name = "show_id")
    private showEntity show;

    @OneToOne
    @JoinColumn(name = "promo_id")
    private promoEntity promoEntity;

    private String promoCode;

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

    public String getCustomerUserName() {
        return customerUserName;
    }

    public void setCustomerUserName(String customerUserName) {
        this.customerUserName = customerUserName;
    }

    public int getChildren() { return this.children; }

    public void setChildren(int children) { this.children = children; }

    public int getAdults() { return this.adults; }

    public void setAdults(int adults) { this.adults = adults;}

    public int getAdultTickets() {
        int adultTickets = 0;
        for (ticketEntity t : tickets) {
            if(t.getAge() == ticketType.ADULT)
                adultTickets = adultTickets + 1;
        }
        return adultTickets;
    }

    public int getChildTickets() {
        int childTickets = 0;
        for (ticketEntity t : tickets) {
            if(t.getAge() == ticketType.CHILD)
                childTickets = childTickets + 1;
        }
        return childTickets;
    }

    public void setOrder_id(long order_id) {
        this.order_id = order_id;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setShow(showEntity show) {
        this.show = show;
    }

    public showEntity getShow() {
        return show;
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
        return promoEntity;
    }

    public void setPromo(promoEntity promo) {
        this.promoEntity = promo;
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
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
