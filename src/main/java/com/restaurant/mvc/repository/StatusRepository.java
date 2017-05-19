package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.StatusOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StatusRepository extends JpaRepository<StatusOrder,Long>{

    @Query("select status from com.restaurant.mvc.domain.StatusOrder status where status.name= :name")
    StatusOrder findByName(@Param("name") String name);

}
