package com.example.asm.controller;

import com.example.asm.entity.ChiTietSP;
import com.example.asm.entity.KichThuoc;
import com.example.asm.entity.MauSac;
import com.example.asm.entity.SanPham;
import com.example.asm.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("sandal/detail/{id}")
public class ProductDetailCtrl {
    @Autowired
    private ISanPhamRepo sanPhamRepo;
    @Autowired
    private IDanhMucRepo danhMucRepo;
    @Autowired
    private INSXRepo nsxRepo;
    @Autowired
    private IChiTietSPRepo chiTietSPRepo;
    @Autowired
    private IKichThuocRepo kichThuocRepo;
    @Autowired
    private IMauSacRepo mauSacRepo;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;
//    private Integer id =0;
    
    @GetMapping
    public ModelAndView detail(@PathVariable("id")Integer id){
//        this.id = id;
        request.setAttribute("product",sanPhamRepo.getReferenceById(id));
        return new ModelAndView("product-detail");
    }

    @GetMapping("getchitietsp")
    public ChiTietSP getChiTietSP(@PathVariable("id")Integer idSP,@RequestParam("idMS")Integer idMS,@RequestParam("idKT")Integer idKT){
        return chiTietSPRepo.getBySanPhamAndKichThuocAndMauSac(sanPhamRepo.getReferenceById(idSP), kichThuocRepo.getReferenceById(idKT), mauSacRepo.getReferenceById(idMS));
    }

    @ModelAttribute("colors")
    public List<MauSac> getMauSac(@PathVariable("id")Integer id){
        return mauSacRepo.getBySanPham(id);
    }
    @ModelAttribute("sizes")
    public List<KichThuoc> getKichThuoc(@PathVariable("id")Integer id){
        return kichThuocRepo.getBySanPham(id);
    }
}
