package com.web.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/demo")
public class DemoController  {
	Logger log = Logger.getLogger(DemoController.class);
	
	@RequestMapping("/transf")
	public ModelAndView transf(HttpServletRequest request){
		ModelAndView  m = new ModelAndView();
		m.addObject("demo", "通过ModelAndView传值1");
		m.addObject("demo1", "通过ModelAndView传值2");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("map1", "Strust");
		map.put("map2", "spring");
		map.put("map3", "springmvc");
		m.addObject("map",map);
		request.setAttribute("demo2", "通过request传值");
		m.setViewName("p4");
		return m;
	}
	/**
	 * 多个URL可以映射到一个处理器的处理方法
	 * @return
	 */
	@RequestMapping(value={"/addUser","addUser2"},method=RequestMethod.POST)
	public ModelAndView addUser(){
		String result ="测试method=RequestMethod GET POST";
		return new ModelAndView("/p7","result",result);
	}
	@RequestMapping(value="/users/{userId}/topics/{topicId}")
	public String test(@PathVariable(value="userId") int userId,@PathVariable(value="topicId") int topicId,Model m){
		log.info("userId="+userId+",----topicId="+topicId);
		m.addAttribute("userId", userId);
		m.addAttribute("topicId", topicId);
		return "/p6";
	}
	
	@RequestMapping("/uploadFile")
	public String uploadFile(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request) throws IOException{
		log.info("fileName---->" + file.getOriginalFilename());
		if(!file.isEmpty()){
			try {
				FileOutputStream os = new FileOutputStream("D:/uploadFile/"+ file.getOriginalFilename());
				InputStream in = file.getInputStream();
				int b = 0;
				while((b=in.read()) != -1){
					os.write(b);
				}
				os.flush();
				os.close();
				in.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("msg", "文件上传成功！");
		return "/p5";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,String> login(HttpServletRequest request){
		 HttpSession session = request.getSession();
		 session.setAttribute(session.getId(), "SpringMVC");
		 Map<String,String> map = new HashMap<String, String>();
		 map.put("result", "ok");
		 map.put("msg", "登陆成功！");
		return map;
	}
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String,String> logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute(session.getId(), null);
		Map<String,String> map = new HashMap<String, String>();
		map.put("result", "ok");
		map.put("msg", "注销成功！");
		return map;
	}
	@RequestMapping("/tologin")
	public String tologin(){
		return "login";
	}
	@RequestMapping("/toIndex")
	public String toIndex(){
		return "/index";
	}
	
	@RequestMapping("/toSuccess")
	public String toSuccess(){
		return "/p5";
	}
	@RequestMapping("/p7")
	public String top7(){
		return "/p7";
	}
	
	@RequestMapping("/exception")
	public String myException(){
		System.out.println(8/0);
		return "/index";
	}
}
