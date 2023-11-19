package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "donhang")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class DonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddonhang")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "iduser")
    private User user;

    @Column(name = "ma")
    private String ma;
    @Column(name = "ngaytao")
    private Date ngayTao;
    @Column(name = "ngaynhan")
    private Date ngayNhan;
    @Column(name = "tennguoinhan")
    private String tenNguoiNhan;
    @Column(name = "diachi")
    private String diaChi;
    @Column(name = "sdt")
    private String sdt;
    @Column(name = "phiship")
    private BigDecimal phiShip;
    @Column(name = "tinhtrang")
    private Integer tinhTrang;
    @Column(name = "phuongthucTT")
    private Integer phuongThucTT;

    @OneToMany(mappedBy = "donHang",fetch = FetchType.EAGER)
    @JsonBackReference
    private List<ChiTietDonHang> lstChiTietDH;

    public Integer getTotalProduct(){
        Integer total = 0;
        for (ChiTietDonHang  c:lstChiTietDH) {
            total += c.getSoLuong();
        }
        return total;
    }
    public BigDecimal getTotalPrice(){
        BigDecimal total = new BigDecimal(0);
        for (ChiTietDonHang  c:lstChiTietDH) {
            total = total.add(c.getDonGiaSauGiam().multiply(BigDecimal.valueOf(c.getSoLuong())));
        }
        return total;
    }

    @Override
    public String toString() {
        return "DonHang{" +
                "id=" + id +
                ", ma='" + ma + '\'' +
                ", ngayTao=" + ngayTao +
                ", ngayNhan=" + ngayNhan +
                ", tenNguoiNhan='" + tenNguoiNhan + '\'' +
                ", diaChi='" + diaChi + '\'' +
                ", sdt='" + sdt + '\'' +
                ", phiShip=" + phiShip +
                ", tinhTrang=" + tinhTrang +
                ", phuongThucTT=" + phuongThucTT +
                '}';
    }
}
