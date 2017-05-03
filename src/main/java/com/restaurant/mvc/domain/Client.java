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
    private Long id;

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

    @Column(name = "phone_clients")
    private String  phoneClient;

    @Column(name = "email")
    private String emailClient;

    @OneToMany(mappedBy = "orderForClient",fetch = FetchType.LAZY)
    private List<Order> order;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    private Role role;

    public Client(String fio) {
        this.fio = fio;
    }

    public Client() {
    }
}
