package com.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.User;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler)
			throws Exception {
			// TODO Auto-generated method stub
			User user = (User) request.getSession().getAttribute("user");
			if (user.getAuthority()==1 ) {
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
			request.getServerPort()
			+ path + "/";
			response.sendRedirect(basePath + "index");
			return false;
			}
			return true;
			}
}
