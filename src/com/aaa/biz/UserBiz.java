package com.aaa.biz;

import com.aaa.entity.User;

/**
 * @class_name：UserBiz
 * @param: 4.service层接口
 * @return: 业务逻辑层
 * @author:Zoutao
 * @createtime:2018年3月21日
 */

public interface UserBiz {
	// 登录查询
	public User CheckLoginAndPwd(String name, String pwd);

	// 注册用户
	public void addUser(User user);
}
