package com.restaurant.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "role")
@Getter @Setter
public class Role implements Serializable{

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name_role")
    private String nameRole;

    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Client> clients;

    @OneToOne
    @PrimaryKeyJoinColumn
    DishCategory category;
}
