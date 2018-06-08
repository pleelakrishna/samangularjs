package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity  
@Inheritance(strategy=InheritanceType.JOINED)  
public class BaseModel {
	
	@Id  
	@GeneratedValue(strategy=GenerationType.AUTO)  
	      
	@Column(name = "id")  
	private int id; 
	private String createdTime;
	
	private String modifiedTime;

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	
	

}
