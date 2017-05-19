package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long>{

    @Query("select o from com.restaurant.mvc.domain.Order o where o.orderForClient.id= :idClient")
    List<Order> findAllByIdClient(@Param("idClient") Long idClient);

    @Query("select o from com.restaurant.mvc.domain.Order o where o.id= :id")
    Order findById(@Param("id") Long id);
}
