package com.aaa.mapper;

import org.apache.ibatis.annotations.Param;
import com.aaa.entity.User;

/**
 * @class_name：UserMapper
 * @param: 2.dao层接口
 * @return: 数据持久化
 * @author:Zoutao
 * @createtime:2018年3月21日
 */
public interface UserMapper {

	// 查询登录账户-用户密码为参数
	public User CheckLoginAndPwd(@Param("username") String name, @Param("password") String pwd);

	// 注册用户
	public void addUser(User user);
}
