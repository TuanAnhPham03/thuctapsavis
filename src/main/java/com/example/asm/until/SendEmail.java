package com.example.asm.until;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class SendEmail {

    @Autowired
    JavaMailSender javaMailSender;

    public void sendEmail(String email, String ma) throws MessagingException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"utf-8");
        helper.setTo(email);
        helper.setSubject("Mã xác thực");
        helper.setText("Mã xác thực của bạn là: "+ma+"\nMã xác thực có hiệu lục 30 giây");

        javaMailSender.send(mimeMessage);
    }
}
