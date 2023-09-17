package com.lantu;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class ax {
    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String rawPassword = "123";
        String encodedPassword = passwordEncoder.encode(rawPassword);

        boolean isMatch = passwordEncoder.matches(rawPassword, encodedPassword);

        if (isMatch) {
            System.out.println("密码匹配");
        } else {
            System.out.println("密码不匹配");
        }
    }
}
