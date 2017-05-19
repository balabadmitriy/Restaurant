package com.restaurant.mvc.dto;

import com.restaurant.mvc.domain.Role;
import lombok.Getter;
import lombok.Setter;
import org.springframework.context.annotation.Scope;

import java.util.Date;

@Getter
@Setter
@Scope("session")
public class ClientDTO {

    private Date dateOfRegistration;

    private String addressDelivery;

    private String fio;

    private String login;

    private String password;

    private String  phoneClient;

    private String emailClient;

    private Role role;

    public ClientDTO() {
        this.dateOfRegistration = new Date();
    }
}
