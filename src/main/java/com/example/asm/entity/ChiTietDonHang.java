package com.example.asm.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "chitietdonhang")
public class ChiTietDonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idchitietdonhang")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idhoadon")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "idchitietsp")
    private ChiTietSP chiTietSP;

    @Column(name = "sl")
    private Integer soLuong;
    @Column(name = "dongia")
    private BigDecimal donGia;
    @Column(name = "dongiasaugiam")
    private BigDecimal donGiaSauGiam;
}
