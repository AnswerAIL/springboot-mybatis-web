package com.answer.springboot.mybatis.web.service;

import com.answer.springboot.mybatis.web.entity.User;

import java.util.List;

/**
 * Created by L.Answer on 2018-10-16 10:27
 */
public interface IUserService {

    int insertUser(User user);

    int deleteUser(Long id);

    int updateUser(User user);

    List<User> findUsers();

}