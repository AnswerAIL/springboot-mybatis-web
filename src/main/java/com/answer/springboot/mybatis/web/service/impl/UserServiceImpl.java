package com.answer.springboot.mybatis.web.service.impl;

import com.answer.springboot.mybatis.web.dao.UserDao;
import com.answer.springboot.mybatis.web.entity.User;
import com.answer.springboot.mybatis.web.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by L.Answer on 2018-10-16 10:27
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserDao userDao;

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int deleteUser(Long id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public List<User> findUsers(Map params) {
        return userDao.findUsers(params);
    }
}