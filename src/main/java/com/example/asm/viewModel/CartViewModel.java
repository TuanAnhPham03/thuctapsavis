package com.example.asm.viewModel;

import lombok.*;

import java.math.BigDecimal;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CartViewModel {
    private Integer idSP;
    private Integer idCTSP;
    private String anh;
    private String ten;
    private String gioiTinh;
    private String nsx;
    private float size;
    private String mauSac;
    private int sl;
    private BigDecimal donGia;
    private Integer giamGia;
    public BigDecimal getDonGiaSauGiam(){
        System.out.println(giamGia);
        BigDecimal soPhanGiam = BigDecimal.valueOf(giamGia*0.01);
        BigDecimal tienGiam = donGia.multiply(soPhanGiam);
        System.out.println("Tiền giảm: "+tienGiam);
        return donGia.subtract(tienGiam);
    }
}
