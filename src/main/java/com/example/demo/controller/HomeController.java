package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.StudentDao;
import com.example.demo.model.Student;

@RestController
public class HomeController {
	
	
	@Autowired
	StudentDao studentDao;
	
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
	    
	
	
	 public void UserController()
	    {
	        userDetailsList.add(new Student("User1", "Mechanical"));
	        userDetailsList.add(new Student("User2", "Electrical"));
	    }
	
	

}
