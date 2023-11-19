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
@Table(name = "chitietsp")
public class ChiTietSP {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idchitietsp")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idsanpham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idmausac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idkichthuoc")
    private KichThuoc kichThuoc;

    @Column(name = "soluong")
    private Integer soLuong;

    @OneToMany(mappedBy = "chiTietSP",fetch = FetchType.EAGER)
    @JsonBackReference
    private List<ChiTietDonHang> lstChiTietDonHang;

    public ChiTietSP(Integer id, SanPham sanPham, MauSac mauSac, KichThuoc kichThuoc, Integer soLuong) {
        this.id = id;
        this.sanPham = sanPham;
        this.mauSac = mauSac;
        this.kichThuoc = kichThuoc;
        this.soLuong = soLuong;
    }

    @Override
    public String toString() {
        return "ChiTietSP{" +
                "id=" + id +
                ", sanPham=" + sanPham.getTen() +
                ", mauSac=" + mauSac.getTen() +
                ", kichThuoc=" + kichThuoc.getMa() +
                ", soLuong=" + soLuong +
                '}';
    }
}
