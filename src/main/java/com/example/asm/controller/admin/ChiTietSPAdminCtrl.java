package com.example.asm.controller.admin;

import com.example.asm.entity.ChiTietSP;
import com.example.asm.entity.KichThuoc;
import com.example.asm.entity.MauSac;
import com.example.asm.entity.SanPham;
import com.example.asm.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("sandal-admin")
public class ChiTietSPAdminCtrl {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private IChiTietSPRepo chiTietSPRepo;

    @Autowired
    private IKichThuocRepo kichThuocRepo;

    @Autowired
    private CartService cartService;
    @Autowired
    private IMauSacRepo mauSacRepo;
    @Autowired
    private ISanPhamRepo sanPhamRepo;

    private List<ChiTietSP> lstChiTietSP = new ArrayList<>();

    private Integer id = 0;

    String alert = "";

    //view
    @GetMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id) {
        ChiTietSP chiTietSP = new ChiTietSP();
        chiTietSP.setSanPham(sanPhamRepo.getReferenceById(id));
        request.setAttribute("ChiTietSP", chiTietSP);
        request.setAttribute("alert", alert);
        alert = "";
        this.id = id;
        return "productDetail_form";
    }

    @GetMapping("productDetails")
    @ResponseBody
    public List<ChiTietSP> getProductDetail() {
        lstChiTietSP = chiTietSPRepo.getBySanPhamOrderByMauSacAscKichThuocAsc(sanPhamRepo.getReferenceById(id));
        return lstChiTietSP;
    }

    //Add
    @PostMapping("detail/add")
//    @ResponseBody
    public String add(@ModelAttribute("ChiTietSP") ChiTietSP chiTietSP, @RequestParam("size") Integer[] size) {
        chiTietSP.setSanPham(sanPhamRepo.getReferenceById(id));
        List<ChiTietSP> lst = new ArrayList<>();
        for (Integer s : size) {
            KichThuoc k = kichThuocRepo.getReferenceById(s);
            chiTietSP.setKichThuoc(k);
            chiTietSPRepo.save(new ChiTietSP(null, chiTietSP.getSanPham(), chiTietSP.getMauSac(), chiTietSP.getKichThuoc(), chiTietSP.getSoLuong()));
        }
        alert = "alert('Thêm thành công')";
        return "redirect:/sandal-admin/detail/" + id;
    }

    //update
    @GetMapping("detail/view-update/{id}")
    @ResponseBody
    public ChiTietSP viewUpdate(@PathVariable("id") Integer id) {
        return chiTietSPRepo.getReferenceById(id);
    }

    @PutMapping("detail/update/{id}")
    @ResponseBody
    public void update(@PathVariable("id") Integer id, @RequestBody Integer soLuong) {
        ChiTietSP chiTietSP = chiTietSPRepo.getReferenceById(id);
        chiTietSP.setSoLuong(soLuong);
        chiTietSPRepo.save(chiTietSP);
//        return sanPhamRepo.getReferenceById(this.id).getLstChiTietSP();
    }

    //delete
    @GetMapping("detail/delete/{id}")
    @ResponseBody
    public void delete(@PathVariable("id") Integer id) {
        cartService.removeProductInCart(id);
        chiTietSPRepo.delete(chiTietSPRepo.getReferenceById(id));
//        return sanPhamRepo.getReferenceById(this.id).getLstChiTietSP();
//        return "redirect:/sanpham-admin/detail/"+this.id;
    }

    @GetMapping("detail/getsize")
    @ResponseBody
    public List<KichThuoc> test(@RequestParam(value = "idMS") Integer idMS) {
        return kichThuocRepo.getBySanPhamAndMauSacInChiTietSP(id, idMS);
    }

    @ModelAttribute("kichThuoc")
    public List<KichThuoc> getKichThuoc() {
        return kichThuocRepo.findAll();
    }

    @ModelAttribute("mauSac")
    public List<MauSac> getMauSac() {
        return mauSacRepo.findAll();
    }
}
