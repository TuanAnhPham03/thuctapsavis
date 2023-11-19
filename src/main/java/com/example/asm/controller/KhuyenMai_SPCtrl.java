package com.example.asm.controller;

import com.example.asm.entity.KhuyenMai_SanPham;
import com.example.asm.repository.IKhuyenMai_SanPhamRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("khuyenmai-sanpham")
public class KhuyenMai_SPCtrl {
    @Autowired
    private IKhuyenMai_SanPhamRepo khuyenMai_sanPhamRepo;
    @GetMapping("getall")
    @ResponseBody
    public List<KhuyenMai_SanPham> getAll(){
        return khuyenMai_sanPhamRepo.getProductOnKhuyenMai();
    }
}
