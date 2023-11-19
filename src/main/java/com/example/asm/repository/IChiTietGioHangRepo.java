package com.example.asm.repository;

import com.example.asm.entity.ChiTietDonHang;
import com.example.asm.entity.ChiTietGioHang;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IChiTietGioHangRepo extends JpaRepository<ChiTietGioHang,Integer> {

}
