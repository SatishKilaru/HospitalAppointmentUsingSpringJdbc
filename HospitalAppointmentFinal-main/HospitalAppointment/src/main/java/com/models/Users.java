package com.models;

public class Users {
  String fname,lname,email,password,phonenumber;

public Users() {
	
	// TODO Auto-generated constructor stub
}

public String getPhonenumber() {
	return phonenumber;
}

public void setPhonenumber(String phonenumber) {
	this.phonenumber = phonenumber;
}

public Users(String fname, String lname, String email, String password) {
	super();
	this.fname = fname;
	this.lname = lname;
	this.email = email;
	this.password = password;
}

public String getFname() {
	return fname;
}

public String getLname() {
	return lname;
}

public String getEmail() {
	return email;
}

public String getPassword() {
	return password;
}

public void setFname(String fname) {
	this.fname = fname;
}

public void setLname(String lname) {
	this.lname = lname;
}

public void setEmail(String email) {
	this.email = email;
}

public void setPassword(String password) {
	this.password = password;
}
  
}
