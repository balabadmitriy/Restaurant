package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

@Setter @Getter
@Entity(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "date_order")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Calendar dateOrder;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private PaymentMethod paymentMethod;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "statusorders")
    private StatusOrder statusOrder;

    @ManyToMany
    @JoinTable(name = "orders_dishes",
            joinColumns = @JoinColumn(name = "orders_id"),
            inverseJoinColumns = @JoinColumn(name = "dishes_id"))
    private List<Dish> dishes;

    public Order() {
        this.dateOrder = new GregorianCalendar();
        this.dishes = new ArrayList<>();
        System.out.println(this.dateOrder.get(Calendar.YEAR) + " "  + this.dateOrder.get(Calendar.MILLISECOND));
    }

    public void addDish(Dish dish){
        this.dishes.add(dish);
    }
}
