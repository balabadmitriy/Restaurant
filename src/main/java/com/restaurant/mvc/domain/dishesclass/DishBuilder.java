package com.restaurant.mvc.domain.dishesclass;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.domain.DishCategory;

public class DishBuilder {

    private String name;
    private Double weight;
    private String img;
    private String composition;
    private DishCategory category;

    public Double getWeight() {
        return weight;
    }

    public DishBuilder setWeight(Double weight) {
        this.weight = weight;
        return this;
    }

    public String getImg() {
        return img;
    }

    public DishBuilder setImg(String img) {
        this.img = img;
        return this;
    }

    public String getComposition() {
        return composition;
    }

    public DishBuilder setComposition(String composition) {
        this.composition = composition;
        return this;
    }

    public DishCategory getCategory() {
        return category;
    }

    public DishBuilder setCategory(DishCategory category) {
        this.category = category;
        return this;
    }

    public DishBuilder(String name) {
        this.name = name;
    }

    public Dish createDish(){
        return new Dish(name,
                        weight,
                        img,
                        composition,
                        category);
    }
}
