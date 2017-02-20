package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Setter @Getter
@Entity(name = "clients")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "date_of_registration")
    @Temporal(value = TemporalType.DATE)
    private Date dateOfRegistration;

    @Column(name = "address_delivery")
    private String addressDelivery;

    @NonNull
    @Column(name = "fio")
    private String fio;

    @NonNull
    @Column(name = "password")
    private String password;

    @OneToOne
    @PrimaryKeyJoinColumn
    private Bill bill;

    @OneToMany(mappedBy = "client")
    private List<PhoneClient> phoneClients;

    @Column(name = "client")
    private String emailClient;

    public Client(String fio) {
        this.fio = fio;
        this.dateOfRegistration = new Date();
    }

    public Client() {
    }
}
