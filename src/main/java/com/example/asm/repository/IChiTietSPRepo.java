package com.example.asm.repository;

import com.example.asm.entity.ChiTietSP;
import com.example.asm.entity.KichThuoc;
import com.example.asm.entity.MauSac;
import com.example.asm.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IChiTietSPRepo extends JpaRepository<ChiTietSP,Integer> {
    List<ChiTietSP> getByMauSacAndSanPham(MauSac m, SanPham s);
    List<ChiTietSP> getBySanPhamOrderByMauSacAscKichThuocAsc(SanPham s);

    ChiTietSP getBySanPhamAndKichThuocAndMauSac(SanPham s,KichThuoc t,MauSac m);
}
