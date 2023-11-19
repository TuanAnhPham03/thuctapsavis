package com.example.asm.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Map;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "chitietsp")
public class ChiTietGioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idchitietgiohang")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idgiohang")
    private GioHang gioHang;

    @ManyToOne
    @JoinColumn(name = "idchitietsp")
    private ChiTietSP chiTietSP;

    @Column(name = "sl")
    private Integer sl;
}
