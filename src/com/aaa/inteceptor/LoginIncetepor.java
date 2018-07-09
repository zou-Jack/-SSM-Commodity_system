package com.aaa.inteceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.aaa.entity.User;

/**
 * @class_name：LoginIncetepor
 * @param: 登录拦截器
 * @return: 继承sprngmvc提供的HandlerInterceptor拦截器，
 * 重构方法
 * @author:Zoutao
 * @createtime:2018年3月21日
 */
public class LoginIncetepor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * 登录拦截器-设置session的时间
	 * 该方法将在登录请求处理之前进行调用，只有该方法返回true时
	 * 才会继续执行后续的Interceptor和Controller，
	 * 当返回值为true 时就会继续调用下一个Interceptor的preHandle 方法，
	 * 如果已经是最后一个Interceptor的时候就会是调用当前请求的Controller方法； 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object hander) throws Exception {
		// TODO Auto-generated method stub
		//获取请求的URL地址
		String url=request.getRequestURI();
		if(url.indexOf("/checkLogin.action")>=0){
			return true;
		}
		if(url.indexOf("/register.action")>=0)
		{
			return true;
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user1");
		session.setMaxInactiveInterval(30*60);
		if(user!=null){
			return true;
		}
		request.getRequestDispatcher("/Login.jsp").forward(request, response);
		return false;
	}
}
