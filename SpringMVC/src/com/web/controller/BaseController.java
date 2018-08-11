package com.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class BaseController {
	
	
	Logger log = Logger.getLogger(BaseController.class);
	@ExceptionHandler
	public String exp(HttpServletRequest request, Exception ex) {

		request.setAttribute("ex", ex.getMessage());
		request.setAttribute("entry", "BaseController");
		
		System.out.println(ex.getMessage());
		
		if(ex instanceof IOException){
			log.info("......IOException...@ExceptionHandler...");
			
			
			
		}else if(ex instanceof SQLException){
			log.info("......SQLException....@ExceptionHandler..");
		}
		return "/p3";

		/*// 鏍规嵁涓嶅悓閿欒杞悜涓嶅悓椤甸潰
		if (ex instanceof BusinessException) {
			return "error-business";
		} else {
			return "error";
		}*/
	}

}
