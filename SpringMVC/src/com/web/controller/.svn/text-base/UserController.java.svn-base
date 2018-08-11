package com.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.controller.entity.User;
import com.web.controller.service.IUserManager;
import com.web.controller.util.DateUtil;
import com.web.controller.util.Page;

@Controller
@RequestMapping("/user")
public class UserController {
 
	@Resource(name="userManager")
	private IUserManager userManager;
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/toAllUser")
	public String toAllUser(){
		return "/userManager";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxSaveUser")
	public Map<String,String> ajaxSaveUser(User user){
		Map<String,String> map = new HashMap<String,String>();
		try {
			userManager.addUser(user);
			map.put("result", "ok");
			map.put("msg", "增加成功");
		} catch (Exception e) {
			map.put("result", "no");
			map.put("msg", "增加失败");
		}
		
		return map;
	}
	@RequestMapping("/addUser")
	public String addUser(@ModelAttribute("user")User user){
		
		userManager.addUser(user);
		
		return "redirect:/user/toAllUser";
	}
	@ResponseBody
	@RequestMapping("/getAllUser")
	public Page getAllUser(Integer page,Integer rows,HttpServletRequest request){
		Page p = userManager.getAllUser(page,rows);
		List<User> lst = p.getRows();
		for(User u:lst){
			if(u.getBirth() !=null){
				u.setDate(DateUtil.dateFormate(u.getBirth()));
			}
		}
		return p;
	}
	
	@ResponseBody
	@RequestMapping("/delUser")
	public Map<String,String>  delUser(@RequestParam("ids[]")List<String> ids,HttpServletResponse response){
		Map<String,String> map = new HashMap<String,String>();
		if(userManager.delUser(ids)){
			map.put("result", "success");
			map.put("msg", "删除成功");
		}else{
			map.put("result", "faile");
			map.put("msg", "删除失败");
		}
		return map;
	}
	@RequestMapping("/updateUser")
	public String updateUser(User user,HttpServletRequest request){
		
		userManager.updateUser(user);
			
		return "redirect:/user/toAllUser";
	}
}
