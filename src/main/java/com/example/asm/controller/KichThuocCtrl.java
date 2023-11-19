package com.example.asm.controller;

import com.example.asm.entity.KichThuoc;
import com.example.asm.repository.IKichThuocRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("kich-thuoc")
public class KichThuocCtrl {
    @Autowired
    IKichThuocRepo kichThuocRepo;
    @GetMapping("getByChieuDai/{chieuDai}")
    @ResponseBody
    public List<KichThuoc> getKichThuoc(@PathVariable("chieuDai")Float chieuDai) {
        return kichThuocRepo.getByDoDai(Float.valueOf(chieuDai));
    }

    @GetMapping("getbysp-ms")
    @ResponseBody
    public List<KichThuoc> getKichThuocByMSAndSP(@RequestParam("idSP")Integer id,@RequestParam("idMS")Integer idMS){
        return kichThuocRepo.getBySanPhamAndMauSacInChiTietSP(id,idMS);
    }
}
