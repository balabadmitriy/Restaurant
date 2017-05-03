package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.repository.DishRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DishService {

    @Autowired
    DishRepository dishRepository;

//    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class )
    public List<Dish> getDishAll(Long id) {
        return dishRepository.findAllByCategoryId(id);
    }

}
