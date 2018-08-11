package com.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Demo2ctl extends MultiActionController {
	Logger log = Logger.getLogger(Demo2ctl.class);
	
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response){
		log.info(".....add....");
		return new ModelAndView("/p2","method","add");
	}
	
	public ModelAndView update(HttpServletRequest request,HttpServletResponse response){
		log.info(".....update....");
		return new ModelAndView("/p2","method","update");
	}

}
