package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.Dish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DishRepository extends JpaRepository<Dish, Long>{

    @Query("select d from com.restaurant.mvc.domain.Dish d where d.category.id= :id")
    List<Dish> findAllByCategoryId(@Param("id") Long id);

    @Query("select d from com.restaurant.mvc.domain.Dish d where d.id= :id")
    Dish findById(@Param("id") Long id);

    @Query("select d from com.restaurant.mvc.domain.Dish d where d.category.name= :name")
    List<Dish> findAllByCategoryName(@Param("name") String name);
}
