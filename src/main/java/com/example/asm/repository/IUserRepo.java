package com.example.asm.repository;

import com.example.asm.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserRepo extends JpaRepository<User,Integer> {
    User getByMa(String ma);
    User getByMaAndMatKhau(String ma,String matKhau);
}
