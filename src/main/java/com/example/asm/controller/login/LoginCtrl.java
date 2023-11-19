package com.example.asm.controller.login;

import com.example.asm.entity.User;
import com.example.asm.repository.IUserRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("login")
public class LoginCtrl {
    @Autowired
    IUserRepo userRepo;
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpServletResponse response;
    @Autowired
    HttpSession session;
    @GetMapping
    public String viewLogin(@ModelAttribute("user") User user){
        request.setAttribute("alert",alert);
        alert = "";

        return "login";
    }

    static String alert = "";

    @PostMapping
    public String Login(@RequestParam("userName")String userName,@RequestParam("passWord")String passWord) {
        User userLogin = userRepo.getByMaAndMatKhau(userName,passWord);
        if(userLogin == null){
            request.setAttribute("error","Sai username hoặc mật khẩu");
            return "login";
        }else{
            session = request.getSession();
            session.setAttribute("user",userLogin);
            return "redirect:/sandal";
        }

    }

}
