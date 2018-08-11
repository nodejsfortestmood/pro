package com.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


public class MyExceptionHandler implements HandlerExceptionResolver {
	Logger log = Logger.getLogger(MyExceptionHandler.class);

	@Override
	public ModelAndView resolveException(HttpServletRequest req,
			HttpServletResponse resp, Object handler, Exception ex) {
		ModelAndView m = new ModelAndView();
		m.addObject("ex", ex.getMessage());
		m.addObject("entry", "MyExceptionHandler");
		m.setViewName("p3");
		if(ex instanceof IOException){
			log.info("......IOException...HandlerExceptionResolver...");
		}else if(ex instanceof SQLException){
			log.info("......SQLException....HandlerExceptionResolver..");
		}
		  return m;
	}

}
