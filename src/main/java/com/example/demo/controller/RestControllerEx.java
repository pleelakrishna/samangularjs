package com.example.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Student;

@RestController
public class RestControllerEx {
	private  final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * test example of rest call
	 */
	@RequestMapping(value="/restexample", method=RequestMethod.POST, consumes = "application/json", produces = "application/json")  
	public void ShowMessage(@RequestBody Student student){
		LOGGER.debug("Calling ShowMessage at controller");
		
		 LOGGER.debug("This is a debug message");
		    LOGGER.info("This is an info message");
		    LOGGER.warn("This is a warn message");
		    LOGGER.error("This is an error message");
		    
		    
		System.out.println("hellow");
		
	}

}
