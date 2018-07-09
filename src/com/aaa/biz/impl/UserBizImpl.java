package com.aaa.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.biz.UserBiz;
import com.aaa.entity.User;
import com.aaa.mapper.UserMapper;

/**
 * @class_name：UserBizImpl
 * @param: 5.impl层实现接口
 * @return: 实现service接口
 * @author:Zoutao
 * @createtime:2018年3月21日
 */

@Service
public class UserBizImpl implements UserBiz {
	@Autowired
	private UserMapper userMapper;

	@Override
	public User CheckLoginAndPwd(String name, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.CheckLoginAndPwd(name, pwd);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}
}
