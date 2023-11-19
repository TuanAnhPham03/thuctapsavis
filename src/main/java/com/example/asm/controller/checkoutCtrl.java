package com.example.asm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("gio-hang/thanh-toan")
public class checkoutCtrl {
    @GetMapping
    public String getCheckOut(){
        return "checkout";
    }
    @GetMapping("thanh-cong")
    public String getComplete(){
        return "order-complete";
    }
}
