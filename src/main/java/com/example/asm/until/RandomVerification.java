package com.example.asm.until;

import org.springframework.stereotype.Component;

import java.util.Random;
@Component
public class RandomVerification {
    private final String numbers = "1234567890";
    public String randomVerification(){
        Random random = new Random();
        StringBuilder builder = new StringBuilder();

        for (int i=0;i<5;i++){
            builder.append(random.nextInt(numbers.length()));
        }
        return builder.toString();
    }
}
