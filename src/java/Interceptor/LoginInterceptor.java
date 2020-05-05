package com.graduationDesign.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/*
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取controller方法上请求的url
		String url = request.getRequestURI();
		if(url.indexOf("/login")>=0) {
			return true;
		}
		//获取session
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		//判断session中是否有用户名，如果有，则返回true，继续向下执行
		if(userName != null) {
			return true;
		}
		//不符合条件的转发到登录页面
		request.getRequestDispatcher("/login").forward(request, response);
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
