package com.restaurant.mvc.dto;

import com.restaurant.mvc.domain.DishCategory;
import com.restaurant.mvc.domain.Order;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;
@Getter @Setter
public class DishDTO implements Serializable{

    private Integer id;

    private String name;

    private Double weight;

    private String img;

    private Long price;

    private String composition;

    private DishCategory category;

    private List<Order> order;


}
