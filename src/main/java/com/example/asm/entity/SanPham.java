package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "sanpham")
//@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="idsanpham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idsanpham")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idnsx")
    private NSX nsx;

    @ManyToOne
    @JoinColumn(name = "iddanhmuc")
    private DanhMuc danhMuc;
    @Column(name = "ma")
    private String ma;
    @Column(name = "ten")
    private String ten;
    @Column(name = "gianhap")
    private BigDecimal giaNhap;
    @Column(name = "giaban")
    private BigDecimal giaBan;
    @Column(name = "mota")
    private String moTa;
    @Column(name = "anh")
    private String anh;
    @Column(name = "ngaythem")
    private Date ngayThem;
    @Column(name = "chatlieu")
    private String chatLieu;
    @Column(name = "trangthai")
    private Integer trangThai;
    @OneToMany(mappedBy = "sanPham", fetch = FetchType.EAGER)
    @JsonBackReference
    private List<ChiTietSP> lstChiTietSP;
    @Override
    public String toString() {
        return "SanPham{" +
                "id=" + id +
                ", nsx=" + nsx.getTen() +
                ", danhMuc=" + danhMuc.getTen() +
                ", ma='" + ma + '\'' +
                ", ten='" + ten + '\'' +
                ", giaNhap=" + giaNhap +
                ", giaBan=" + giaBan +
                ", moTa='" + moTa + '\'' +
                ", anh='" + anh + '\'' +
                ", ngayThem=" + ngayThem +
                ", trangThai=" + trangThai +
                '}';
    }
}
