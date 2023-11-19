package com.example.asm.repository;

import com.example.asm.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface IDonHangRepo extends JpaRepository<DonHang,Integer> {

}
