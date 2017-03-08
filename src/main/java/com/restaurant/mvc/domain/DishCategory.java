package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Setter @Getter
@Entity(name = "categories")
public class DishCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "category")
    private List<Dish> dish;

    @OneToOne
    Role role;
}
