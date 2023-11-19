package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@ToString
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iduser")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idvaitro")
    private VaiTro vaiTro;

    @Column(name = "ma")
    @NotBlank(message = "Không để trống Username")
    private String ma;
    @Column(name = "ho")
    @NotBlank(message = "Không để trống họ")
    private String ho;
    @Column(name = "tendem")
    @NotBlank(message = "Không để trống tên đệm")
    private String tenDem;
    @Column(name = "ten")
    @NotBlank(message = "Không để trống tên")
    private String ten;
    @Column(name = "gioitinh")
    private String gioiTinh;
    @Column(name = "ngaysinh")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate ngaySinh;
    @Column(name = "thanhpho")
    private String thanhPho;
    @Column(name = "diachi")
    private String diaChi;
    @Column(name = "matkhau")
    @NotBlank(message = "Không để trống Password")
    private String matKhau;
    @Column(name = "anh")
    private String anh;
    @Column(name = "email")
    @NotBlank(message = "Không để trống email")
    @Email(message = "Email Không đúng định dạng")
    private String email;
    @Column(name = "sdt")
    private String sdt;
    @OneToOne(mappedBy = "user")
    private GioHang gioHang;

    public String getHoTen(){
        return ho + " " + tenDem + " " + ten;
    }

    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
    @JsonBackReference
    @ToString.Exclude
    private List<DonHang> lstDonHang;
}
