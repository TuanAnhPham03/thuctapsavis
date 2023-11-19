package com.example.asm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "vaitro")
public class VaiTro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idvaitro")
    private Integer id;

    @Column(name = "ten")
    private String ten;

    @OneToMany(mappedBy = "vaiTro",fetch = FetchType.EAGER)
    @JsonBackReference
    private List<User> lstUser;
}
