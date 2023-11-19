package com.example.asm.controller;

import com.example.asm.entity.NSX;
import com.example.asm.repository.INSXRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("nsx")
public class NsxCtrl {
    @Autowired
    INSXRepo nsxRepo;
    @GetMapping("get-nsx")
    @ResponseBody
    public List<NSX> getNSX(){
        return nsxRepo.findAll();
    }
}
