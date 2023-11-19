package com.example.asm.repository;

import com.example.asm.entity.ChiTietDonHang;
import com.example.asm.entity.DonHang;
import com.example.asm.viewModel.ThongKeViewModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface IDonHangChiTietRepo extends JpaRepository<ChiTietDonHang,Integer> {
    @Query("""
    SELECT SUM(c.soLuong) FROM ChiTietDonHang c WHERE c.donHang.id = ?1
""")
    Integer getSlSPByDonHang(Integer idDonHang);

    @Query("""
    SELECT SUM(c.soLuong * c.donGiaSauGiam) FROM ChiTietDonHang c WHERE c.donHang.id = ?1
""")
    BigDecimal getTotalPriceByDonHang(Integer idDonHang);

    List<ChiTietDonHang> getByDonHang(DonHang donHang);

    @Query("""
        SELECT new com.example.asm.viewModel.ThongKeViewModel(c.chiTietSP.sanPham,sum(c.soLuong) ) 
        FROM ChiTietDonHang c 
        WHERE c.donHang.ngayTao >= :firstDate and c.donHang.ngayTao <= :lastDate
        group by c.chiTietSP.sanPham
        ORDER BY sum(c.soLuong)  DESC 
""")
    Page<ThongKeViewModel> getTop10BanChay(Pageable pageable, @Param("firstDate")Date firstDate,@Param("lastDate")Date lastDate);

    @Query("""
        SELECT new com.example.asm.viewModel.ThongKeViewModel(c.sanPham,sum(c.soLuong) ) 
        FROM ChiTietSP c
        WHERE c.sanPham.id not in ( select c.chiTietSP.sanPham.id FROM ChiTietDonHang c
                                    WHERE c.donHang.ngayTao >= :firstDate and c.donHang.ngayTao <= :lastDate)           
        group by c.sanPham
        ORDER BY sum(c.soLuong)  DESC
""")
    Page<ThongKeViewModel> getTop10HangTon(Pageable pageable, @Param("firstDate")Date firstDate,@Param("lastDate")Date lastDate);
}
