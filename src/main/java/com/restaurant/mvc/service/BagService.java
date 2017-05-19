package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.repository.DishRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class BagService {

    @Autowired
    DishRepository dishRepository;

    public List<Dish> getDishForomBags(HttpSession session) {
        List<String> bags = (List<String>) session.getAttribute("sessionReq");
        String payment = (String) session.getAttribute("payment");
        List<Dish> tmp1 = getDishes(bags);
        if (tmp1 != null) return tmp1;
        return null;
    }

    public List<Dish> getDishes(List<String> bags) {
        List<Dish> tmp = new ArrayList<>();
        if (bags != null && bags.size() != 0) {
            bags.forEach(id ->
                    tmp.add(
                            dishRepository.findById(Long.valueOf(id))
                    )
            );
            return tmp;
        }
        return null;
    }


}
