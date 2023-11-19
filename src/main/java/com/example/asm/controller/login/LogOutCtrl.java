package com.example.asm.controller.login;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("logout")
public class LogOutCtrl {
    @Autowired
    private HttpSession session;
    @GetMapping
    public String logOut(){
        session.invalidate();
        return "redirect:/sandal";
    }
}
