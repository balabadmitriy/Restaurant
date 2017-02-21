package com.restaurant.mvc.dto;

import com.restaurant.mvc.domain.Bill;
import com.restaurant.mvc.domain.PhoneClient;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import javax.validation.constraints.Pattern;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class ClientDTO {

    private Date dateOfRegistration;

    private String addressDelivery;

    @NonNull
    @Pattern(regexp = "\\w{3,}", message = "Name incorrect")
    private String fio;

    @NonNull
    private String password;

    private Bill bill;

    private List<PhoneClient> phoneClients;

    @NonNull
    private String emailClient;
}
