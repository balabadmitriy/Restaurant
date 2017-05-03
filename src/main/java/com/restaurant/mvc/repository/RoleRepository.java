package com.restaurant.mvc.repository;

import com.restaurant.mvc.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("rolerepo")
public interface RoleRepository extends JpaRepository<Role, Long>{

    @Query("select role from com.restaurant.mvc.domain.Role role where role.nameRole= :name")
    Role findRoleByName(@Param("name") String name);

}
