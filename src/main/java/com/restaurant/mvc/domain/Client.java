package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Setter @Getter
@Entity(name = "clients")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "date_of_registration")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date dateOfRegistration;

    @Column(name = "address_delivery")
    private String addressDelivery;

    @NonNull
    @Column(name = "fio")
    private String fio;

    @NonNull
    @Column(name = "login")
    private String login;

    @NonNull
    @Column(name = "password")
    private String password;

    @OneToOne
    @PrimaryKeyJoinColumn
    private Bill bill;

    @Column(name = "phone_clients")
    private String  phoneClient;

    @Column(name = "email")
    private String emailClient;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    private Role role;

    public Client(String fio) {
        this.fio = fio;
    }

    public Client() {
    }
}
