package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Setter @Getter
@Entity(name = "dishes")
public class Dish  implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "weight")
    private Double weight;

    @Column(name = "img")
    private String img;

    @Column(name = "price")
    private Long price;

    @Column(name = "composition")
    private String composition;

    @ManyToOne
    private DishCategory category;

    @ManyToMany(mappedBy = "dishes")
    private List<Order> order;

    public Dish() {
        this.order = new ArrayList<>();
    }
    public Dish(String newName,Double newWeight,String newImg,String newComposition,
                DishCategory newCategory){
        this.order = new ArrayList<>();
        this.name = newName;
        this.weight = newWeight;
        this.img = newImg;
        this.composition = newComposition;
        this.category = newCategory;
    }

    public void addOrder(Order order){
        this.order.add(order);
    }
}
