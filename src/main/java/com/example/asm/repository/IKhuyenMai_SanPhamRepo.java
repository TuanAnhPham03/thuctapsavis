package com.example.asm.repository;

import com.example.asm.entity.KhuyenMai;
import com.example.asm.entity.KhuyenMai_SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IKhuyenMai_SanPhamRepo extends JpaRepository<KhuyenMai_SanPham,Integer> {
    @Query("""
    select k FROM KhuyenMai_SanPham k
    WHERE k.khuyenMai.trangThai = 1
""")
    List<KhuyenMai_SanPham> getProductOnKhuyenMai();
    @Query("""
    select k FROM KhuyenMai_SanPham k
    WHERE k.khuyenMai.id = :idKM
""")
    List<KhuyenMai_SanPham> getProductOnKhuyenMaiByMaKM(@Param("idKM")Integer maKM);

    @Query("""
        delete FROM KhuyenMai_SanPham k WHERE k.khuyenMai.id = :idKM
""")
    void deleteByIdKhuyenMai(@Param("idKM")Integer idKM);

    Long deleteByKhuyenMai(KhuyenMai khuyenMai);
}
