package com.example.asm.controller.interseptor;

import com.example.asm.entity.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;

@Component
public class QuanTriInterseptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");

        if(user == null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.println("""
                    <h1>Lỗi truy cập</h1> 
                    <br>
                    <p>Đăng nhập để sử dụng tính năng</p>
                    <br>
                    <a href="/login" role="button">Đăng Nhập</a>
                    """);
            return false;
        }else if(user.getVaiTro().getId() != 1){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<h1>Lỗi truy cập</h1>" +
                    "<br>" +
                    "<p>Không đủ thẩm quyền</p>");
            return false;
        }else{
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
