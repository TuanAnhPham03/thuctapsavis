package com.example.asm.controller;

import com.example.asm.entity.User;
import com.example.asm.repository.IUserRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("user")
public class UserCtrl {
    @Autowired
    private IUserRepo userRepo;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;

    String alert = "";
    @GetMapping("{id}")
    public String getUser(@PathVariable("id")Integer id){
        User user = userRepo.getReferenceById(id);
        request.setAttribute("user",user);
        request.setAttribute("alert",alert);
        alert = "";
        return "user";
    }

    @PostMapping("update/{id}")
    public String updateUser(@PathVariable("id")Integer id, @ModelAttribute("user")User user,
                             @RequestParam(value = "ngaySinh",required = false)
                             @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)Date ngaySinh ) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        User userLogin = (User) session.getAttribute("user");

        user.setId(id);
        user.setMa(userLogin.getMa());
        user.setMatKhau(userLogin.getMatKhau());
        user.setVaiTro(userLogin.getVaiTro());
        System.out.println(ngaySinh);
        userRepo.save(user);
        alert = "alert('Lưu thông tin người dùng thành công')";
        return "redirect:/user/"+id;
    }
}
