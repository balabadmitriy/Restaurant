package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Setter @Getter
@Entity(name = "status_orders")
public class StatusOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "statusOrder",fetch = FetchType.LAZY)
    private List<Order> order;

    public StatusOrder() {
        this.order = new ArrayList<>();
    }

    public void addOrder(Order order){
        this.order.add(order);
    }
}
