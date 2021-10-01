package com.learn.myEcart.Dao;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.myEcart.entities.Product;
import com.mysql.cj.Query;

import java.util.List;

import org.hibernate.Session;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();
			f = true;
		}

		catch (Exception e) {
			e.printStackTrace();
			f = false;

		}
		return f;
	}
	
	
//	get all products
	
	public List<Product> getAllProduct(){
	
		Session s=this.factory.openSession();
		org.hibernate.query.Query query= s.createQuery("from Product");
		List<Product> list=query.list();
		return list;
		
	}
	
//	get all products by Id
	
	public List<Product> getAllProductById(int cid){
	
		Session s=this.factory.openSession();
		org.hibernate.query.Query query= s.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Product> list=query.list();
		return list;
		
	}
	

}
