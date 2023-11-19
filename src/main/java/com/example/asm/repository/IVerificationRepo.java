package com.example.asm.repository;

import com.example.asm.entity.User;
import com.example.asm.entity.Verification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IVerificationRepo extends JpaRepository<Verification,Integer> {
    Verification getByMaAndUser(String ma, User user);

    @Query(value = """
        SELECT * FROM sandal.Verification
        WHERE idUser = ?1 
        AND (now()+0) - (Time+0) <= 30
        OrDER BY TIME DESC
        Limit 1
""",nativeQuery = true)
    Verification getByMaAndUserAfter30s(Integer idUser);

    void deleteByUser(User user);
}
