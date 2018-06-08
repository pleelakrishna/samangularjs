package com.example.demo.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Company;
import com.example.demo.model.Employee;

import net.minidev.json.JSONObject;

@Transactional
@Repository
public class HibernDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) 
	{
		this.sessionFactory = sf;
	}

	
	
	public List<?> showHbquries()
	 {
		
		String hql = "from Company as comp inner join comp.employees as emp";
		
		 Query query=sessionFactory.getCurrentSession().createQuery(hql);
		List<?> list = query.list();
		
		for(int i=0; i<list.size(); i++) {
			Object[] row = (Object[]) list.get(i);
			Company company = (Company)row[0];
			Employee employee = (Employee)row[1];
			System.out.println("CompId:"+company.getCompName()+", CompName:"+ company.getCompName()+
					   ", EmpId:"+ employee.getEmpName()+", EmpName:"+ employee.getEmpName());
		}	
		
		
		return list;
	 }
	
	
	public void saveData(Employee emp){
	sessionFactory.getCurrentSession().save(emp);
		
	}
	

}
