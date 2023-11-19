package com.example.asm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("danh-sach-yeu-thich")
public class WishlistCtrl {
    @GetMapping
    public String getWishlist(){
        return "add-to-wishlist";
    }
}
