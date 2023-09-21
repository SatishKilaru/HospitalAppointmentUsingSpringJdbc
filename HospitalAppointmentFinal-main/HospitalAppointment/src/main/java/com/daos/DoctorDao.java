package com.daos;

import java.util.ArrayList;

import com.models.Doctor;
import com.models.DoctorSlots;
import com.models.Patient;
import com.models.Users;

public interface DoctorDao {
	ArrayList<Doctor> getAllDoctors();
	ArrayList<DoctorSlots> getSlotsById(int doc_id,int year,int month,int day); 
	boolean addUser(Users ur);
    boolean verifyUser(String email,String pwd);
	boolean updateSlots(DoctorSlots ds);
	boolean addPatient(Patient pt);
	boolean bookAppointment(Patient pt, DoctorSlots ds);
	ArrayList<DoctorSlots> getSlotsOfDoctor(int doc_id);
}