package com.models;

public class Patient {
	String fname,lname,gender,phone;
	int age;
	public String getFname() {
		return fname;
	}
	public String getLname() {
		return lname;
	}
	public String getGender() {
		return gender;
	}
	public int getAge() {
		return age;
	}
	public String getPhone() {
		return phone;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Patient() {
		
		// TODO Auto-generated constructor stub
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
