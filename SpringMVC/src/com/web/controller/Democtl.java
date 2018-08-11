package com.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Democtl implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("map1", "strust2");
		map.put("map2", "springmvc");
		map.put("map3", "play");
		return new ModelAndView("/p1","map",map);
	}

}
