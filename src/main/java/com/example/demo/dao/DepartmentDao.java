package com.example.demo.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Department;
@Transactional
@Repository
public class DepartmentDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Department> departmentsList()
	{
		String hql ="select * from department";
		
		RowMapper<Department> rowMapper = new BeanPropertyRowMapper<Department>(Department.class);
		
		   List<Department> list =jdbcTemplate.query(hql,rowMapper);
		   
		   return list;
		
	}
	
	
	public Map<String,String> departmentsMap()
	{
		
		Map<String,String> deptMap =new LinkedHashMap();
	List<Department> list =departmentsList();
			for(Department entry:list)
		                   deptMap.put(String.valueOf(entry.getId()) ,entry.getName());
		return deptMap;
		
		
		
	}
	
	

}
