package com.web.controller.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.controller.entity.User;
import com.web.controller.util.Page;
//@Repository("userDao")
public class UserDAO implements IUserDAO  {
  //  @Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public Page getAllUser(Integer page,Integer rows) {
		if(page ==null){page =1;}
		if(rows ==null){rows =10;}
		Page p = new Page();
		String hql = "from User";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult((page - 1) * rows);
		query.setMaxResults(rows);
		Query queryCount = sessionFactory.getCurrentSession().createQuery(hql);
		p.setTotal(queryCount.list().size());
		p.setRows(query.list());
		return p;
	}

	@Override
	public boolean delUser(List<String> ids) {
		String hql = "delete User u where u.id in(:ids)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("ids", ids);
		return (query.executeUpdate() > 0);
	}

	@Override
	public User getUser(String id) {
		String hql = "from User u where u.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);
		
		return (User) query.uniqueResult();
	}

	@Override
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public boolean login(String username, String pasword) {
		
		String hql = "from User u where u.userName=? and u.pasword=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, username);
		query.setString(1, pasword);
		
		return query.list().size()>0;
	}
	
	

}
