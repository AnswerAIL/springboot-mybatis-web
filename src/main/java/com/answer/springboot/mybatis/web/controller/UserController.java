package com.answer.springboot.mybatis.web.controller;

import com.answer.springboot.mybatis.web.entity.User;
import com.answer.springboot.mybatis.web.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Created by L.Answer on 2018-10-16 10:53
 */

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private IUserService userService;


    @RequestMapping("index")
    public String index(Model model) {
        logger.info("enter index.jsp.");
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss:SSS");

        User user = new User();
        user.setUserName("answerCoder" + LocalDateTime.now().format(dateTimeFormatter));
        user.setSex(1);
        user.setAddress("pt");
        user.setEmail("answer_ljm@163.com");
        model.addAttribute("user", user);
        model.addAttribute("age", "7");
        userService.insertUser(user);
        return "index";
    }


    @RequestMapping("findUsers")
    @ResponseBody
    public List<User> findUsers() {
        logger.info("find users start.");
        List<User> users = userService.findUsers();
        logger.info("users size: " + users.size());
        return users;
    }








}