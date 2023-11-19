package com.example.asm.controller.login;

import com.example.asm.entity.User;
import com.example.asm.repository.IUserRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("doi-mat-khau")
public class DoiMatKhau {
    @Autowired
    IUserRepo userRepo;
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpSession session;

    String alert = "";

    @GetMapping
    public String viewForm(){
        request.setAttribute("alert",alert);
        alert = "";
        return "DoiMatKhau";
    }
    @PostMapping
    public String updatePass(@RequestParam(value = "passOld",required = false)String pass,
                             @RequestParam(value = "passNew",required = false)String passNew,
                             @RequestParam(value = "confirmPass",required = false)String passConfirm){
        User userSession = (User) session.getAttribute("user");
        if(!pass.equalsIgnoreCase(userSession.getMatKhau())){
            request.setAttribute("errorOld","Không đúng mật khẩu");

            return "DoiMatKhau";
        }
        if(!passNew.equalsIgnoreCase(passConfirm)){
            request.setAttribute("errorConfirm","Vui lòng nhập lại chính xác mật khẩu");
            return "DoiMatKhau";
        }
        User user = userRepo.getReferenceById(userSession.getId());
        user.setMatKhau(passNew);
        userRepo.save(user);
        alert = "alert('Đổi mật khẩu thành công')";
        return "redirect:/doi-mat-khau";
    }
}
