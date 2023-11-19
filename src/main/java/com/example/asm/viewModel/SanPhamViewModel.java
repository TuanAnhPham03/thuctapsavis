package com.example.asm.viewModel;

import com.example.asm.entity.SanPham;
import lombok.*;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SanPhamViewModel {
    private SanPham sanPham;
    private Integer giamGia;
}
