package com.restaurant.mvc.domain;

import lombok.*;

import javax.persistence.*;

@Setter @Getter
@RequiredArgsConstructor
@NoArgsConstructor
@Entity(name = "phones")
public class PhoneClient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Column(name = "number")
    private Double number;

    @NonNull
    @ManyToOne
    @PrimaryKeyJoinColumn
    private Client client;
}
