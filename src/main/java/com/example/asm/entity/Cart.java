package com.example.asm.entity;

import lombok.*;

import java.util.HashMap;
import java.util.Map;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Cart {
    private Map<Integer,Integer> productInCart = new HashMap<>();
}
