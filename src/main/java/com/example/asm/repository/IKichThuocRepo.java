package com.example.asm.repository;

import com.example.asm.entity.KichThuoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IKichThuocRepo extends JpaRepository<KichThuoc,Integer> {
    @Query( value = "SELECT distinct KichThuoc.* FROM sandal.ChiTietSP \n" +
            "Join SanPham on SanPham.idSanPham = ChiTietSP.IdSanPham \n" +
            "Join KichThuoc on KichThuoc.idKichThuoc = ChiTietSP.IdKichThuoc\n" +
            "WHERE SanPham.idSanPham = ?1",nativeQuery = true)
    List<KichThuoc> getBySanPham(Integer id);

    List<KichThuoc> getByDoDai(Float doDai);

    List<KichThuoc> getByIdNotIn(List<Integer> id);

    @Query(value = "SELECT KichThuoc.* FROM KichThuoc \n" +
            "            WHERE KichThuoc.idKichThuoc not in( \n" +
            "SELECT KichThuoc.IdKichThuoc FROM sandal.ChiTietSP \n" +
            "\t\t\tjoin SanPham on SanPham.idSanPham = ChiTietSP.IdSanPham\n" +
            "            Join KichThuoc on KichThuoc.idKichThuoc = ChiTietSP.IdKichThuoc\n" +
            "            Join MauSac on MauSac.IdMauSac = ChiTietSP.IDMauSac\n" +
            "            WHERE SanPham.idSanPham = ?1  and MauSac.IdMauSac = ?2)\n",nativeQuery = true)
    List<KichThuoc> getBySanPhamAndMauSacNotInChiTietSP(Integer idSP,Integer idMS);

    @Query(value = "SELECT KichThuoc.* FROM sandal.ChiTietSP \n" +
            "\t\t\tjoin SanPham on SanPham.idSanPham = ChiTietSP.IdSanPham\n" +
            "            Join KichThuoc on KichThuoc.idKichThuoc = ChiTietSP.IdKichThuoc\n" +
            "            Join MauSac on MauSac.IdMauSac = ChiTietSP.IDMauSac\n" +
            "            WHERE SanPham.idSanPham = ?1  and MauSac.IdMauSac = ?2\n",nativeQuery = true)
    List<KichThuoc> getBySanPhamAndMauSacInChiTietSP(Integer idSP,Integer idMS);

}
