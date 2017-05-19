package com.restaurant.mvc.dto;

import com.restaurant.mvc.domain.DishCategory;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter @Setter
public class DishCategoryName implements Serializable {
    List<DishCategory> name;
}
