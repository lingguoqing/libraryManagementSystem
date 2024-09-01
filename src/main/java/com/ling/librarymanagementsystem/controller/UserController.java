package com.ling.librarymanagementsystem.controller;


import com.ling.librarymanagementsystem.common.ResultResponse;
import com.ling.librarymanagementsystem.model.dto.user.UserRegisterRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

    @PostMapping("/register")
    public ResultResponse register(@RequestBody UserRegisterRequest userRegisterRequest) {
        return null;
    }
    @PostMapping("/login")
    public ResultResponse login(@RequestBody UserRegisterRequest userRegisterRequest) {
        return null;
    }
}
