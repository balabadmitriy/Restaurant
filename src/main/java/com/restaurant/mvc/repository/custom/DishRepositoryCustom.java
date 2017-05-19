package com.restaurant.mvc.repository.custom;

import com.restaurant.mvc.domain.Dish;

import java.util.List;

public interface DishRepositoryCustom {
    List<Dish> getDishesByOrder(Long id);
}
