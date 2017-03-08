package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.Client;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("clientRepository")
public interface ClientRepository extends JpaRepository<Client, Long>{

    @Query("select c from com.restaurant.mvc.domain.Client c where c.login = :login")
    Client findUserByLogin(@Param("login") String login);
}
