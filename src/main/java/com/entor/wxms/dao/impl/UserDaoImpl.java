package com.entor.wxms.dao.impl;

import org.springframework.stereotype.Repository;

import com.entor.wxms.dao.UserDao;
import com.entor.wxms.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

}
