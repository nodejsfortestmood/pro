package com.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/demo3")
public class Demo3ctl /*extends BaseController*/ {
	
	@RequestMapping("/ex1")
	public String excetion1() throws IOException{
		if(true){
			throw new IOException("测试IOException");
		}
		return null;
	}
	
	@RequestMapping("/ex2")
	public String excetion2() throws SQLException{
		if(true){
			throw new SQLException("测试SQLException");
		}
		return null;
	}

}
