package com.example.asm.controller;

import com.example.asm.entity.*;
import com.example.asm.repository.*;
import com.example.asm.viewModel.CartViewModel;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("don-hang")
public class DonHangCtrl {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IDonHangRepo donHangRepo;
    @Autowired
    private CartService cartService;
    @Autowired
    private IDonHangChiTietRepo donHangChiTietRepo;
    @Autowired
    private IChiTietSPRepo chiTietSPRepo;
    @Autowired
    private HttpSession session;
    @Autowired
    private IKhuyenMai_SanPhamRepo khuyenMai_sanPhamRepo;

    @GetMapping
    public String getOrderJsp(){
        request.setAttribute("orders",donHangRepo.findAll(Sort.by(Sort.Direction.DESC,"ngayTao")));
        return "orders";
    }


    @GetMapping("mua-ngay")
    @ResponseBody
    public Integer muaNgay(@RequestParam("idCTSP")Integer idCTSP,@RequestParam("sl")Integer sl) throws ParseException {
        Integer slSanPham = chiTietSPRepo.getReferenceById(idCTSP).getSoLuong();
        System.out.println("sl SP: "+slSanPham+" - SL: "+sl);
        if(slSanPham < sl || sl <= 0) return 0;

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        User user = (User) session.getAttribute("user");

        DonHang donHang = new DonHang();
        donHang.setMa("DH"+simpleDateFormat.format(new Date()));
        donHang.setNgayTao(simpleDateFormat.parse(simpleDateFormat.format(new Date())));
        donHang.setTinhTrang(0);
        donHang.setUser(user);
        donHang.setTenNguoiNhan(user.getHoTen());
        donHang.setDiaChi(user.getDiaChi());
        donHang.setSdt(user.getSdt());
        donHang.setPhuongThucTT(1);

        donHangRepo.save(donHang);

        ChiTietSP chiTietSP = chiTietSPRepo.getReferenceById(idCTSP);
        BigDecimal donGiaSauGiam = chiTietSP.getSanPham().getGiaBan();
        List<KhuyenMai_SanPham> lst = khuyenMai_sanPhamRepo.getProductOnKhuyenMai();
        for (KhuyenMai_SanPham k:lst) {
            if(k.getSanPham().getId() == chiTietSP.getSanPham().getId()){
                BigDecimal soPhanGiam = BigDecimal.valueOf(k.getKhuyenMai().getMucGiam() * 0.01);
                BigDecimal tienGiam = chiTietSP.getSanPham().getGiaBan().multiply(soPhanGiam);
                donGiaSauGiam = donGiaSauGiam.subtract(tienGiam);
            }
        }
        ChiTietDonHang chiTietDonHang = new ChiTietDonHang();
        chiTietDonHang.setDonHang(donHang);
        chiTietDonHang.setChiTietSP(chiTietSP);
        chiTietDonHang.setDonGia(chiTietSP.getSanPham().getGiaBan());
        chiTietDonHang.setDonGiaSauGiam(donGiaSauGiam);
        chiTietDonHang.setSoLuong(sl);
        donHangChiTietRepo.save(chiTietDonHang);

        chiTietSP.setSoLuong(chiTietSP.getSoLuong() - sl);
        chiTietSPRepo.save(chiTietSP);

        return 1;
    }

    @GetMapping("thanh-toan")
    public String thanhToan(@ModelAttribute("DonHang")DonHang donHang){
        System.out.println("aa");
        return "checkout";
    }

    @PostMapping("thanh-toan/success")
    public String success(@ModelAttribute("DonHang")DonHang donHang) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        User user = (User) session.getAttribute("user");

        donHang.setMa("DH"+simpleDateFormat.format(new Date()));
        donHang.setNgayTao(simpleDateFormat.parse(simpleDateFormat.format(new Date())));
        donHang.setTinhTrang(0);
        donHang.setUser(user);

        donHangRepo.save(donHang);
        System.out.println(donHang.toString());

        List<CartViewModel> productInCart  = cartService.getCartViewModel();
        for (CartViewModel  c :productInCart ) {
            ChiTietSP chiTietSP = chiTietSPRepo.getReferenceById(c.getIdCTSP());
            donHangChiTietRepo.save(new ChiTietDonHang(null,donHang,chiTietSP,c.getSl(),c.getDonGia(),c.getDonGiaSauGiam()));

            chiTietSP.setSoLuong(chiTietSP.getSoLuong() - c.getSl());
            chiTietSPRepo.save(chiTietSP);
        }
        cartService.removeAllProdcutInCart();
        return "order-complete";
    }

    @GetMapping("getdonhang/{id}")
    @ResponseBody
    public DonHang getDonHang(@PathVariable("id")Integer id){
        return donHangRepo.getReferenceById(id);
    }

    @GetMapping("getproductinorder/{id}")
    @ResponseBody
    public List<ChiTietDonHang> getChiTietDonHang(@PathVariable("id")Integer id){
        return donHangChiTietRepo.getByDonHang(donHangRepo.getReferenceById(id));
    }
    @GetMapping("total-product")
    @ResponseBody
    public Integer getTotalProduct(@RequestParam("id")Integer id){
        return 0;
    }
    @GetMapping("total-price")
    @ResponseBody
    public BigDecimal getTotalPrice(@RequestParam("id")Integer id){
        return BigDecimal.valueOf(0);
    }


}
