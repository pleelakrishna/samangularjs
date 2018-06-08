package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dao.HibernDao;
import com.example.demo.model.Company;
import com.example.demo.model.Employee;

@Controller
public class HQLJoinDemoController {
	
	@Autowired HibernDao hibernDao;
	
	@GetMapping("/hb")
	public void executeHqlQuries()
	{
		//JSONObject Obj =new JSONObject();
		
	  List<?> samples	=hibernDao.showHbquries();
	  
	  
	  Employee emp =new Employee();
	  
	  emp.setCreatedTime("1515");
	  emp.setModifiedTime("2020");
	  emp.setEmpName("leela");
	  
	  Company cmp =new Company();
	  
	  
	  hibernDao.saveData(emp);
	  
	  
	 // Obj.put("samples", samples);
	  
	  
	  
	  
	  
	}
	 

}
