package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Setter @Getter
@Entity(name = "categories")
public class DishCategory implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "category",fetch = FetchType.EAGER)
    private List<Dish> dish;

    @OneToOne
    Role role;
}
