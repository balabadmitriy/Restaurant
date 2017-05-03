package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.DishCategory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Qualifier("categoryRepository")
public interface DishCategoryRepository  extends JpaRepository<DishCategory, Long> {

    @Query("select c from com.restaurant.mvc.domain.DishCategory c where c.role.id= :idRole")
    List<DishCategory> findCategoryByIdRole(@Param("idRole") Long idRole);

}
