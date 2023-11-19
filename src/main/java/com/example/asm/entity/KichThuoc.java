package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "kichthuoc")
public class KichThuoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idkichthuoc")
    private Integer id;
    @Column(name = "ma")
    private Float ma;
    @Column(name = "dodai")
    private Float doDai;

    @OneToMany(mappedBy = "kichThuoc", fetch = FetchType.EAGER)
    @JsonBackReference
    private List<ChiTietSP> lstChiTietSP;
}
