package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.PaymentMethod;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod,Long>{

    @Query("select p from com.restaurant.mvc.domain.PaymentMethod p where p.paymentName= :name")
    PaymentMethod getByName(@Param("name") String name);
}
