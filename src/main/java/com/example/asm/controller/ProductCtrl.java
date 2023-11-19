package com.example.asm.controller;

import com.example.asm.entity.DanhMuc;
import com.example.asm.entity.KhuyenMai;
import com.example.asm.entity.NSX;
import com.example.asm.entity.SanPham;
import com.example.asm.repository.*;
import com.example.asm.viewModel.ThongKeViewModel;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("sandal")
public class ProductCtrl {
    @Autowired
    IDonHangChiTietRepo donHangChiTietRepo;
    @Autowired
    EntityManager entityManager;
    @Autowired
    private ISanPhamRepo sanPhamRepo;
    @Autowired
    private IDanhMucRepo danhMucRepo;
    @Autowired
    private INSXRepo insxRepo;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IKhuyenMaiRepo khuyenMaiRepo;

    private List<SanPham> lstSanPham = new ArrayList<>();

    public static String alert = "";

    @RequestMapping
    public String view(){
        Pageable pageable = PageRequest.of(0,6);
        return "index";
    }

    @RequestMapping("product")
    @ResponseBody
    public Page page(@RequestParam("page")Integer trang){
        Pageable pageable = PageRequest.of(trang,6);
        Page<SanPham> page = sanPhamRepo.getByTrangThai(1,pageable);
        return page;
    }

    @GetMapping("tim-kiem")
    public String getProductsByName(@RequestParam("keyWord")String keyWord){
        lstSanPham = sanPhamRepo.getByTenContains(keyWord);
        request.setAttribute("products",lstSanPham);
        return "add-to-wishlist";
    }

    @GetMapping(value = "filter")
    @ResponseBody
    public Page<SanPham> filter(@RequestParam(defaultValue = "0")Integer page){
//        System.out.println("success");
//        DanhMuc d = danhMucRepo.getReferenceById(idDanhMuc);
//        NSX n = insxRepo.getReferenceById(idThuongHieu);
        Pageable pageable = PageRequest.of(page,6);
        BigDecimal min = request.getParameter("min").isEmpty() ? null : BigDecimal.valueOf(Double.parseDouble(request.getParameter("min")));
        BigDecimal max = request.getParameter("max").isEmpty() ? null : BigDecimal.valueOf(Double.parseDouble(request.getParameter("max")));
        Integer idNSX = request.getParameter("thuongHieu").isEmpty() ? null : Integer.parseInt(request.getParameter("thuongHieu"));
        Integer idDanhMuc = request.getParameter("gioiTinh").isEmpty() ? null : Integer.parseInt(request.getParameter("gioiTinh"));
        return getMultipleProperties(min,max,idNSX,idDanhMuc,pageable);
    }

    //////////////////////////////////////////////////////////////////////////////
    @GetMapping("nam")
    public String getNamSandal(){
        lstSanPham = sanPhamRepo.getByDanhMucOrDanhMucAndTrangThai(danhMucRepo.getReferenceById(1), danhMucRepo.getReferenceById(3),1 );
        request.setAttribute("products",lstSanPham);
        return "men";
    }

    @GetMapping("nam/{nsx}")
    public String getNamSandal(@PathVariable("nsx")Integer idNSX){
        NSX nsx = insxRepo.getReferenceById(idNSX);
        lstSanPham = sanPhamRepo.getByDanhMucOrDanhMucAndTrangThaiAndNsx(danhMucRepo.getReferenceById(1), danhMucRepo.getReferenceById(3),1,nsx );
        request.setAttribute("products",lstSanPham);
        return "men";
    }

    @GetMapping("nu")
    public String getNuSandal(){
        lstSanPham = sanPhamRepo.getByDanhMucOrDanhMucAndTrangThai(danhMucRepo.getReferenceById(2), danhMucRepo.getReferenceById(3),1 );
        request.setAttribute("products",lstSanPham);
        return "women";
    }

    @GetMapping("nu/{nsx}")
    public String getNuSandal(@PathVariable("nsx")Integer idNSX){
        NSX nsx = insxRepo.getReferenceById(idNSX);
        lstSanPham = sanPhamRepo.getByDanhMucOrDanhMucAndTrangThaiAndNsx(danhMucRepo.getReferenceById(2), danhMucRepo.getReferenceById(3),1,nsx );
        request.setAttribute("products",lstSanPham);
        return "men";
    }

    //////////////////////////////////////////////////////////////////////////////
    @ModelAttribute("danhMuc")
    public List<DanhMuc> getDanhMuc(){
        return danhMucRepo.findAll();
    }

    @ModelAttribute("nsx")
    public List<NSX> getNSX(){
        return insxRepo.findAll();
    }

    //////////////////////////////////////////////////////////////////////////////
    @RequestMapping("test")
    @ResponseBody
    public Page<SanPham> test(@RequestParam(defaultValue = "0")Integer pageNumber){
        Pageable pageable = PageRequest.of(pageNumber,3);
        BigDecimal min = request.getParameter("min")==null ? null : BigDecimal.valueOf(Double.parseDouble(request.getParameter("min")));
        BigDecimal max = request.getParameter("max")==null ? null : BigDecimal.valueOf(Double.parseDouble(request.getParameter("max")));
        Integer idNSX = request.getParameter("nsx")==null ? null : Integer.parseInt(request.getParameter("nsx"));
        Integer idDanhMuc = request.getParameter("gioiTinh")==null ? null : Integer.parseInt(request.getParameter("gioiTinh"));
        return getMultipleProperties(min,max,idNSX,idDanhMuc,pageable);
    }
    public Page<SanPham> getMultipleProperties(BigDecimal min,BigDecimal max,Integer idNSX, Integer idDanhMuc,Pageable pageable){
        StringBuilder jpql = new StringBuilder("SELECT s FROM SanPham s WHERE s.trangThai = 1");
        if(min != null) jpql.append("AND giaBan >= " + min);
        if(max != null) jpql.append("AND giaBan <= " + max);
        if(idNSX != null) jpql.append("AND s.nsx.id = " + idNSX);
        if(idDanhMuc != null) jpql.append("AND s.danhMuc.id = " + idDanhMuc);

        System.out.println(jpql);
        int firtsResult = pageable.getPageNumber() * pageable.getPageSize();
        Query query = entityManager.createQuery(String.valueOf(jpql))
                .setFirstResult(firtsResult)
                .setMaxResults(pageable.getPageSize());

        String countQuerry = jpql.toString().replace("SELECT s","SELECT count(*)");
        Integer totalElm = Integer.parseInt(entityManager.createQuery(countQuerry).getSingleResult().toString());
        System.out.println(totalElm);
        return new PageImpl<>(query.getResultList(),pageable,totalElm);
    }


    @RequestMapping("thongke")
    public String thongKe(@ModelAttribute("KhuyenMai")KhuyenMai khuyenMai){
        request.setAttribute("alert",alert);
        alert = "";
        request.setAttribute("deals",khuyenMaiRepo.findAll(Sort.by(Sort.Direction.DESC,"id")));
        return "thongKe";
    }
    @RequestMapping("top10-banchay")
    @ResponseBody
    public Page<ThongKeViewModel> top10BanChay(@RequestParam(value = "firstDate",required = false)String firstDate,
                                               @RequestParam(value = "lastDate",required = false)String lastDate) throws ParseException {
        Pageable pageable = PageRequest.of(0,10);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return donHangChiTietRepo.getTop10BanChay(pageable,simpleDateFormat.parse(firstDate+ " 00:00:00"),simpleDateFormat.parse(lastDate+ " 23:59:59"));
    }
    @RequestMapping("top10-hangton")
    @ResponseBody
    public Page<ThongKeViewModel> top10HangTon(@RequestParam(value = "firstDate",required = false)String firstDate,
                                               @RequestParam(value = "lastDate",required = false)String lastDate) throws ParseException {
        Pageable pageable = PageRequest.of(0,10);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return donHangChiTietRepo.getTop10HangTon(pageable,simpleDateFormat.parse(firstDate+ " 00:00:00"),simpleDateFormat.parse(lastDate+ " 23:59:59"));
    }
}
