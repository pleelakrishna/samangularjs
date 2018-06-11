package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.DepartmentDao;
import com.example.demo.dao.StudentDao;
import com.example.demo.model.Department;
import com.example.demo.model.Student;

@RestController
public class HomeController {
	
	
	
	
	@Autowired
	StudentDao studentDao;
	@Autowired DepartmentDao departmentDao;
	
	public List<Student> userDetailsList = new ArrayList<Student>();
	
	/*@GetMapping("/")
	public String Home(Model model)
	{
		
		return "Home";
	}
	
	*/
	
	
	
	
	@RequestMapping(value="/userdetails",method=RequestMethod.GET,produces="application/json")
    public List<Student> GetUserdetails()
    {
		System.out.println("hello");
		 System.out.println(studentDao.studentslist());
		  return studentDao.studentslist();
    }
	
	
	
	 @RequestMapping(value="/deleteuser",consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.DELETE)
	    public ResponseEntity DeleteUser(@RequestBody Student userDetails)
	    {
	        
		 
		      int result =studentDao.removestudent(userDetails);
		      if (result != 0) {
		    	  return new ResponseEntity(HttpStatus.OK);
				}
		      else
		    	  return new ResponseEntity(HttpStatus. NOT_FOUND);
	        
	    }
	 
	 
	 
	 @RequestMapping(value="/user",consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	    public ResponseEntity ProcessUser(@RequestBody Student userDetails)
	    {
		 if(userDetails.getId() == 0)
		 {
			 studentDao.saveStudent(userDetails);
			  return new ResponseEntity(HttpStatus.OK);
		 }
		 else
		 {
		 
		 int result =studentDao.editStudent(userDetails);
	      if (result != 0) {
	    	  return new ResponseEntity(HttpStatus.OK);
			}
	      else
	    	  return new ResponseEntity(HttpStatus. NOT_FOUND);
		 }
	    }
	    
	
	
	
	 
	 
	 @RequestMapping(value="/deptList",method=RequestMethod.GET,produces="application/json")
	    public List<Department> getDepartmentsLsit()
	    {
		 System.out.println("departmentsList");
			  return departmentDao.departmentsList();
	    }
	 
	 @RequestMapping(value="/savestudent",consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	    public ResponseEntity saveStudent(@RequestBody Student userDetails)
	    {
		 
			 studentDao.saveStudent(userDetails);
			  return new ResponseEntity(HttpStatus.OK);
		 
		
	    }
	
	

}
