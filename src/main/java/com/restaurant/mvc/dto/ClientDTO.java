package com.restaurant.mvc.dto;

import com.restaurant.mvc.domain.Bill;
import com.restaurant.mvc.domain.PhoneClient;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Pattern;
import java.util.Date;
import java.util.List;

@Getter
@Setter

public class ClientDTO {

    private Date dateOfRegistration;

    private String addressDelivery;

    @Pattern(regexp = "\\w{3,}", message = "Name incorrect")
    private String fio;


    private String password;

    private Bill bill;

    private List<PhoneClient> phoneClients;


    private String emailClient;

    public ClientDTO() {
        this.dateOfRegistration = new Date();
    }
}
