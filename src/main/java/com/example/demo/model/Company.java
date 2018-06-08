package com.example.demo.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="company")
@PrimaryKeyJoinColumn(name="ID")  
public class Company extends BaseModel{
	
	@Column(name="comp_name")
	private String compName;
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="comp_id")
	private Set<Employee> employees;
	
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public Set<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	} 
	
	
	
} 