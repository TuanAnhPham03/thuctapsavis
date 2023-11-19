package com.example.asm.controller;

import com.example.asm.entity.ChiTietSP;
import com.example.asm.repository.CartService;
import com.example.asm.repository.IChiTietSPRepo;
import com.example.asm.viewModel.CartViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gio-hang")
public class CartCtrl {

    @Autowired
    private CartService cartService;
    @Autowired
    private IChiTietSPRepo chiTietSPRepo;
    @GetMapping
    public String getCart(){
        return "cart";
    }

    @GetMapping("getprodctincart")
    @ResponseBody
    public List<CartViewModel> getProductInCart(){
        return cartService.getCartViewModel();
    }

    @GetMapping("add-to-cart")
    @ResponseBody
    public Map<Integer, Integer> addToCart(@RequestParam("idCTSP")Integer idCTSP,@RequestParam("sl")Integer sl){
        Integer slSanPham = chiTietSPRepo.getReferenceById(idCTSP).getSoLuong();
        System.out.println("sl SP: "+slSanPham+" - SL: "+sl);
        if(slSanPham < sl || sl <= 0) return null;
        cartService.addOrUpdateToCart(idCTSP,sl);
        return cartService.getProductInCart();
    }

    @GetMapping("update-sl")
    @ResponseBody
    public List<CartViewModel> updateSL(@RequestParam("idCTSP")Integer idCTSP,@RequestParam("sl")Integer sl){
        Integer slSanPham = chiTietSPRepo.getReferenceById(idCTSP).getSoLuong();
        System.out.println("sl SP: "+slSanPham+" - SL: "+sl);
        if(slSanPham < sl || sl <= 0) return null;
        cartService.updateSoLuong(idCTSP,sl);
        return cartService.getCartViewModel();
    }

    @GetMapping("remove/{key}")
    @ResponseBody
    public  List<CartViewModel>removeProductInCart(@PathVariable("key")Integer idCTSP){
        cartService.removeProductInCart(idCTSP);
        return cartService.getCartViewModel();
    }

    @GetMapping("getTotalProduct")
    @ResponseBody
    public Integer getTotalProduct(){
        Integer sl = 0;
        for (CartViewModel c:cartService.getCartViewModel()) {
            sl += c.getSl();
        }
        return sl;
    }

    @GetMapping("getTotalPrice")
    @ResponseBody
    public BigDecimal getTotalPrice(){
        BigDecimal total = new BigDecimal(0);
        for (CartViewModel c:cartService.getCartViewModel()) {
            System.out.println("Đơn giá sau giảm: "+c.getDonGiaSauGiam());
            BigDecimal thanhTien = c.getDonGiaSauGiam().multiply(BigDecimal.valueOf(c.getSl()));
            System.out.println("Thành tiền: "+thanhTien);
            total = total.add(thanhTien);
        }
        return total;
    }
}
