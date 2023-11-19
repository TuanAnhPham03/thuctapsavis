package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "danhmuc")
//@JsonIdentityInfo(generator= ObjectIdGenerators.PropertyGenerator.class, property="iddanhmuc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddanhmuc")
    private Integer id;
    @Column(name = "ma")
    private String ma;
    @Column(name = "ten")
    private String ten;

    @OneToMany(mappedBy = "danhMuc", fetch = FetchType.EAGER)
    @JsonBackReference
    private List<SanPham> lstSanPham;
}
