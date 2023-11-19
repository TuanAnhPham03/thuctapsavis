package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Type;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "nsx")
//@JsonIdentityInfo(generator= ObjectIdGenerators.PropertyGenerator.class, property="idnsx")
public class NSX {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idnsx")
    private Integer id;
    @Column(name = "ma")
    private String ma;
    @Column(name = "ten")
    private String ten;

    @OneToMany(mappedBy = "nsx", fetch = FetchType.EAGER)
    @JsonBackReference
    private List<SanPham> lstSanPham;
}
