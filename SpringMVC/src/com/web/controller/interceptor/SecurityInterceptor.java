package com.web.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityInterceptor  extends HandlerInterceptorAdapter{
	Logger log = Logger.getLogger(SecurityInterceptor.class);
  @Override
public void afterCompletion(HttpServletRequest request,
		HttpServletResponse response, Object handler, Exception ex)
		throws Exception {
}
  @Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
  @Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		HandlerMethod hm = (HandlerMethod) handler;
		log.info(".........访问方法.........."+hm.getMethod().getName());
		if(session.getAttribute(session.getId())==null){
			log.info("用户未登陆！。。。。。");
			
			response.sendRedirect("/SpringMVC/nologin.jsp");
		}else{
		//	log.info("用户已登陆！。。。。。");
		}
	  
	  return true;
	}
}
