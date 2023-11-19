package com.example.asm.repository;

import com.example.asm.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IMauSacRepo extends JpaRepository<MauSac,Integer> {
    @Query( value = "SELECT distinct MauSac.* FROM sandal.ChiTietSP \n" +
            "Join SanPham on SanPham.idSanPham = ChiTietSP.IdSanPham \n" +
            "Join MauSac on MauSac.IdMauSac = ChiTietSP.IDMauSac\n" +
            "WHERE SanPham.idSanPham = ?1",nativeQuery = true)
    List<MauSac> getBySanPham(Integer id);
}
