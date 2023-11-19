package com.example.asm.repository;

import com.example.asm.entity.DanhMuc;
import com.example.asm.entity.NSX;
import com.example.asm.entity.SanPham;
import com.example.asm.viewModel.SanPhamViewModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;

public interface ISanPhamRepo extends JpaRepository<SanPham,Integer> {
    Page<SanPham> getByTrangThaiAndGiaBanBetween(Integer trangThai, BigDecimal min,BigDecimal max, Pageable pageable);
    Page<SanPham> getByTrangThai(Integer trangThai,Pageable pageable);
    List<SanPham> getByTenContains(String keyWord);
    List<SanPham> getByDanhMucOrDanhMucAndTrangThai(DanhMuc d1,DanhMuc d2,Integer trangThai);
    List<SanPham> getByDanhMucOrDanhMucAndTrangThaiAndNsx(DanhMuc d1, DanhMuc d2, Integer trangThai, NSX nsx);
    Page<SanPham> getByTenContains(String keyWord,Pageable pageable);
    Page<SanPham> getByDanhMucAndTrangThaiAndNsx(DanhMuc d1, Integer trangThai,NSX nsx,Pageable pageable);


}
