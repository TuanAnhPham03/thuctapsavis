package com.example.asm.controller.interseptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterSeptorConfig implements WebMvcConfigurer {
    @Autowired
    QuanTriInterseptor quanTriInterseptor;
    @Autowired
    NguoiDungInterseptor nguoiDungInterseptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(quanTriInterseptor).addPathPatterns("/sandal-admin/**")
        .addPathPatterns("/sandal/thongke/**")
        .addPathPatterns("/khuyen-mai/**")
        .addPathPatterns("/don-hang");

        registry.addInterceptor(nguoiDungInterseptor)
                .addPathPatterns("/don-hang/mua-ngay")
                .addPathPatterns("/don-hang/thanh-toan/**")
                .addPathPatterns("/user/**");
    }
}
