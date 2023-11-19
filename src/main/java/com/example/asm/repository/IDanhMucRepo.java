package com.example.asm.repository;

import com.example.asm.entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IDanhMucRepo extends JpaRepository<DanhMuc,Integer> {
}
