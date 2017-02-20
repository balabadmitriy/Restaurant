package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter @Getter
@Entity(name = "bill")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "numberBill")
    private Integer nuberBill;

    @Column(name = "dateComplition")
    @Temporal(value = TemporalType.DATE)
    private Date dateComplition;

    @ManyToOne
    private Staff staff;

    @Column(name = "amount_dishes")
    private Integer amountDishes;

    @ManyToMany
    @JoinTable(name = "blls_dishes",
            joinColumns = @JoinColumn(name = "bills_id"),
            inverseJoinColumns = @JoinColumn(name = "dishes_id"))
    private List<Dish> dishes;

    @OneToOne
    private Client client;

    public Bill() {
        this.dishes = new ArrayList<>();
        this.dateComplition = new Date();
    }

    public Bill(Integer nuberBill){
        this.dishes = new ArrayList<>();
        this.nuberBill = nuberBill;
        this.dateComplition = new Date();
    }

    public void addDish(Dish ... dishes){
        for (Dish dish : dishes) {
            this.dishes.add(dish);
        }
        setAmountDishes(dishes.length);
    }
}
