package com.ming.service.impl;
import com.ming.dao.UserDao;
import com.ming.pojo.User;
import com.ming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *@program: train_ssm
 *@description:
 *@author: ming
 *@create: 2020-09-21 21:32
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    /**
     * 用户登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    /**
     * 注册
     * @param user
     */
    @Override
    public void registered(User user) {
        userDao.registered(user);
    }
}
