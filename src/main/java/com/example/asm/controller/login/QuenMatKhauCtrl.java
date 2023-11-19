package com.example.asm.controller.login;

import com.example.asm.entity.User;
import com.example.asm.entity.Verification;
import com.example.asm.repository.IUserRepo;
import com.example.asm.repository.IVerificationRepo;
import com.example.asm.until.RandomVerification;
import com.example.asm.until.SendEmail;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("quen-mat-khau")
public class QuenMatKhauCtrl {

    @Autowired
    IUserRepo userRepo;
    @Autowired
    IVerificationRepo verificationRepo;
    @Autowired
    HttpServletRequest request;
    @Autowired
    private SendEmail sendEmail;
    @Autowired
    private RandomVerification randomVerification;

    private User user = null;

    String error ="";

    @GetMapping
    public String view(){
        return "quenMK/getUser";
    }
    @PostMapping
    public String getUser(@RequestParam("userName")String userName) throws MessagingException {
        user = userRepo.getByMa(userName);
        if(user == null){
            request.setAttribute("error","User không tồn tại");
            return "quenMK/getUser";
        }else{

            String ma = randomVerification.randomVerification();
            verificationRepo.save(new Verification(null,user,ma,new Date()));
            sendEmail.sendEmail(user.getEmail(),ma);
            return "redirect:/quen-mat-khau/verification";
        }
    }

    @GetMapping("verification")
    public String viewVerification(){
        request.setAttribute("error",error);
        error = "";
        return "quenMK/verification";
    }

    @PostMapping("verification")
    public String verification(@RequestParam("verification")String ma){
        Verification verification = verificationRepo.getByMaAndUserAfter30s(user.getId());
        if(verification == null || !ma.equals(verification.getMa())){
            error = "Mã xác thực không chính xác hoặc hết hiệu lực";
            return "redirect:/quen-mat-khau/verification";
        }else{
            return "redirect:/quen-mat-khau/tao-moi-mat-khau";
        }
    }

    @GetMapping("tao-moi-mat-khau")
    public String getNewPass(){
        return "quenMK/newPass";
    }
    @PostMapping("tao-moi-mat-khau")
    @Transactional
    public String setNewPass(@RequestParam(value = "passNew",required = false)String passNew,
                             @RequestParam(value = "confirmPass",required = false)String passConfirm){
        if(!passNew.equalsIgnoreCase(passConfirm)){
            request.setAttribute("errorConfirm","Vui lòng nhập lại chính xác mật khẩu");
            return "quenMK/newPass";
        }
        user.setMatKhau(passNew);
        userRepo.save(user);
        verificationRepo.deleteByUser(user);
        LoginCtrl.alert = "alert('Tạo mới mật khẩu thành công')";
        return "redirect:/login";
    }

    @GetMapping("gui-lai-ma")
    public String guiLaiMa() throws MessagingException {
            String ma = randomVerification.randomVerification();
            verificationRepo.save(new Verification(null,user,ma,new Date()));
            sendEmail.sendEmail(user.getEmail(),ma);
            return "redirect:/quen-mat-khau/verification";
    }
}
