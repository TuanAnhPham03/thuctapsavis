package com.example.asm.controller;

import com.example.asm.entity.SanPham;
import com.example.asm.repository.ISanPhamRepo;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("index")
public class indexCtrl {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISanPhamRepo sanPhamRepo;

    private List<SanPham> lstSanPham = new ArrayList<>();

//    @RequestMapping
//    public String viewAll(){
//        lstSanPham = sanPhamRepo.getByTrangThai(1);
//        request.setAttribute("products",lstSanPham);
//        return "index";
//    }
}
