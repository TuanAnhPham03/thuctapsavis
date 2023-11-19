package com.example.asm.controller.admin;

import com.example.asm.entity.ChiTietSP;
import com.example.asm.entity.DanhMuc;
import com.example.asm.entity.NSX;
import com.example.asm.entity.SanPham;
import com.example.asm.repository.CartService;
import com.example.asm.repository.IDanhMucRepo;
import com.example.asm.repository.INSXRepo;
import com.example.asm.repository.ISanPhamRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
//@RestController
@RequestMapping("sandal-admin")
public class SanPhamAdminCtrl {

    private SimpleDateFormat dateFM = new SimpleDateFormat("yyy-MM-dd");

    @Autowired
    private ISanPhamRepo sanPhamRepo;

    @Autowired
    private IDanhMucRepo danhMucRepo;

    @Autowired
    private INSXRepo nsxRepo;

    @Autowired
    private CartService cartService;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    private List<SanPham> lstSanPham = new ArrayList<>();
    String alert = "";
    //view
    @GetMapping
    public String viewProduct(){
        request.setAttribute("alert",alert); alert="";
//        ModelAndView mav = new ModelAndView("product_admin");
        return "product_admin";
    }

    @GetMapping("getProducts")
    @ResponseBody
    public Page<SanPham> getProducts(@RequestParam("page")Integer trang,@RequestParam(value = "keyWord",required = false)String keyWord){
        Page<SanPham> page = null;
        System.out.println(keyWord);
        Pageable pageable = PageRequest.of(trang,4);
        if(keyWord == null || keyWord.length() == 0 || keyWord.isBlank()){
            page = sanPhamRepo.findAll(pageable);
        }else page = sanPhamRepo.getByTenContains(keyWord,pageable);
        return page;
    }

    //Add
    @GetMapping("view-add")
    public String viewAdd(){
        request.setAttribute("SanPham",new SanPham());
        request.setAttribute("url","/sandal-admin/add");
        request.setAttribute("button","Thêm");
        ModelAndView mav = new ModelAndView("product_form");
        return "product_form";
    }
    @PostMapping("add")
    public String productAdd(@ModelAttribute("SanPham") SanPham sanPham) throws IOException {
        try {
            sanPham.setNgayThem(dateFM.parse(dateFM.format(new Date())));
            sanPhamRepo.save(sanPham);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        alert="alert('Thêm thành công')";
//        response.sendRedirect("/sanpham-admin");
        return "redirect:/sandal-admin";
    }
    //Update
    @GetMapping("viewupdate/{id}")
    public String productViewUpdate(@PathVariable("id")int id){
        SanPham s = sanPhamRepo.getReferenceById(id);
        request.setAttribute("SanPham",s);
        request.setAttribute("url","/sandal-admin/update/"+s.getId());
        request.setAttribute("button","Cập Nhật");
        return "product_form";
    }
    @PostMapping("update/{id}")
    public String productUpdate(@ModelAttribute("SanPham") SanPham sanPham,@PathVariable("id")int id) throws IOException {
        sanPham.setId(id);
        sanPham.setNgayThem(sanPhamRepo.findById(id).get().getNgayThem());
        sanPhamRepo.save(sanPham);
//        response.sendRedirect("/sanpham-admin");
        alert="alert('Cập nhật thành công')";
        return "redirect:/sandal-admin";
    }
    //UpdateStatus
    @GetMapping("update-status/{id}")
    @ResponseBody
    public void UpdateStatus(@PathVariable("id")int id) throws IOException {
        System.out.println(id);
        SanPham s = sanPhamRepo.getReferenceById(id);
        if(s.getTrangThai()==1){
            s.setTrangThai(0);
            System.out.println(s.getTrangThai());
        }else{
            s.setTrangThai(1);
            System.out.println(s.getTrangThai());
        }
        sanPhamRepo.save(s);
//        return 6;
    }

    //Delete
    @GetMapping("delete/{id}")
    @ResponseBody
    public List<SanPham> delete(@PathVariable("id")int id) throws IOException {

        SanPham s = sanPhamRepo.getReferenceById(id);
        for (ChiTietSP c: s.getLstChiTietSP()) {
            cartService.removeProductInCart(c.getId());
        }

        sanPhamRepo.deleteById(id);
        return sanPhamRepo.findAll();
    }



    @GetMapping(value = "test",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<SanPham> test() {
        return sanPhamRepo.findAll();
    }

    @ModelAttribute("danhMuc")
    public List<DanhMuc> getDanhMuc(){
        return danhMucRepo.findAll();
    }
    @ModelAttribute("nsx")
    public List<NSX> getNSX(){
        return nsxRepo.findAll();
    }
}
