package com.entor.wxms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entor.wxms.entity.User;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User>{

}
