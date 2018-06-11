package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Student;
@Transactional
@Repository
public class StudentDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Student> studentslist()
	{
		String hql ="select * from student";
		
		RowMapper<Student> rowMapper = new BeanPropertyRowMapper<Student>(Student.class);
		
		   List<Student> list =jdbcTemplate.query(hql,rowMapper);
		   
		   return list;
		
	}
	
	public int removestudent(Student student)
	{
		String hql ="delete from student where id="+student.getId();
		
		RowMapper<Student> rowMapper = new BeanPropertyRowMapper<Student>(Student.class);
		
		   //List<Student> list =jdbcTemplate.query(hql,rowMapper);
		   int result =jdbcTemplate.update(hql);
		   
		   return result;
		
	}
	public int editStudent(Student student)
	{
		String hql ="update student set name='"+student.getName()+"' ,department= '"+student.getDepartmentid()+"' where id="+student.getId()+" ";  
		
		RowMapper<Student> rowMapper = new BeanPropertyRowMapper<Student>(Student.class);
		
		   //List<Student> list =jdbcTemplate.query(hql,rowMapper);
		   int result =jdbcTemplate.update(hql);
		   
		   return result;
		
	}

	public void saveStudent(Student userDetails) {
		// TODO Auto-generated method stub
		String hql ="INSERT INTO student (departmentid,name,mobile,sal) VALUES ( '"+userDetails.getDepartmentid()+" ' ,'"+userDetails.getName()+" ','"+userDetails.getMobile()+" ','"+userDetails.getSal()+" ') ";
		
		jdbcTemplate.update(hql);
	}

}
