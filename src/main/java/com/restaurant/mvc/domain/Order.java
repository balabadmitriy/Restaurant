package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Setter @Getter
@Entity(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_order")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date dateOrder;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private PaymentMethod paymentMethod;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "statusorders")
    private StatusOrder statusOrder;

    @Column(name = "status_pay_order")
    private Integer statusPayOrder;

    @Column(name = "numberBill")
    private Integer nuberBill;

    @ManyToOne
    private Staff staff;

    @Column(name = "amount_dishes")
    private Integer amountDishes;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_for_client")
    private Client orderForClient;

    @Column(name = "sum")
    private Long sum;

    @ManyToMany
    @JoinTable(name = "orders_dishes",
            joinColumns = @JoinColumn(name = "orders_id"),
            inverseJoinColumns = @JoinColumn(name = "dishes_id"))
    private List<Dish> dishes;

    public Order() {
        this.dateOrder = new Date();

    }

    public void addDish(Dish dish){
        this.dishes.add(dish);
    }
}
