package com.web.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.controller.dao.IUserDAO;
import com.web.controller.entity.User;
import com.web.controller.util.Page;
//@Service("userManager")
public class UserManager implements IUserManager {
	//@Autowired
	private IUserDAO userDao;
	
	
	public void setUserDao(IUserDAO userDao) {
		this.userDao = userDao;
	}


	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}


	@Override
	public Page getAllUser(Integer page,Integer rows) {
		return userDao.getAllUser(page,rows);
	}


	@Override
	public boolean delUser(List<String> ids) {
		return userDao.delUser(ids);
	}


	@Override
	public User getUser(String id) {
		return userDao.getUser(id);
	}


	@Override
	public void updateUser(User user) {
		 userDao.updateUser(user);
	}


	@Override
	public boolean login(String username, String pasword) {
		return userDao.login(username, pasword);
	}

}
