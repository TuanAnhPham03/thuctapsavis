package com.example.asm.controller.login;

import com.example.asm.entity.User;
import com.example.asm.entity.VaiTro;
import com.example.asm.repository.IUserRepo;
import com.example.asm.repository.IVaiTroRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("dang-ky")
public class signup {

    @Autowired
    HttpServletRequest request;
    @Autowired
    private IUserRepo userRepo;
    @Autowired
    private IVaiTroRepo vaiTroRepo;

    @GetMapping
    public String view(@ModelAttribute("user")User user){
        request.setAttribute("roles",vaiTroRepo.findAll());
        return "signup";
    }
    @PostMapping
    public String dangKy(@Valid @ModelAttribute("user")User user, @RequestParam("confirmPass") String confirmPass,
                         BindingResult result){

        if(result.hasErrors()) return "signup";

        User userCheck = userRepo.getByMa(user.getMa());
        System.out.println(user.toString());
        if(userCheck != null) {
            request.setAttribute("error","Username đã được sử dụng");
            return "signup";
        }

        if(!user.getMatKhau().equalsIgnoreCase(confirmPass)){
            request.setAttribute("errorConfirm","Vui lòng nhập lại chính xác mật khẩu");
            return "signup";
        }

        userRepo.save(user);
        request.setAttribute("user",new User());
        LoginCtrl.alert = "alert('Đăng ký thành công')";
        return "redirect:/login";
    }

    @ModelAttribute("roles")
    public List<VaiTro> getRoles(){
        return vaiTroRepo.findAll();
    }
}
