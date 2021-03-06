package com.restaurant.mvc.domain;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity(name = "staffs")
@NoArgsConstructor
@RequiredArgsConstructor
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    @Column(name = "fio")
    private String fio;

    @Column(name = "date_birth")
    @Temporal(value = TemporalType.DATE)
    private Date dateBirth;

    @Column(name = "position")
    private String position;

    @Column(name = "date_arranged")
    @Temporal(value = TemporalType.DATE)
    private Date dateArranged;

    @Column(name = "free_man")
    private Boolean freeMan;



}
