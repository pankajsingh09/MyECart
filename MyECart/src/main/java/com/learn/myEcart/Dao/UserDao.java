package com.learn.myEcart.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.learn.myEcart.entities.User;

public class UserDao {
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByNameAndPassword(String email,String password)
	{
		User user=null;
		
		try {
			
			String query="from User where userEmail=:e and userPassword=:p";
			Session s=this.factory.openSession();	 
			Query q=s.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user =(User) q.uniqueResult();
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}

}
