package com.daos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import com.models.DoctorMapper;
import com.models.DoctorSlots;
import com.models.DoctorSlotsMapper;
import com.models.Patient;
import com.models.Users;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.daos.DoctorDao;
import com.models.Doctor;

public class DoctorDaoImp implements DoctorDao {
	JdbcTemplate jdbcTemplate;
	
	String SQL_GET_DOCTORS = "select * from mbs_doctors";
	String SQL_GET_SLOTS_BY_ID = "select * from mbs_slots where s_status='Available' and s_docid=? and s_date=?";
	String SQL_INSERT_USER = " insert into mbs_users(fname,lname,email,password,phonenumber) values(?,?,?,?,?)";
	String SQL_VERIFY_USER = "select count(*) from mbs_users where email=? and password=?";
	String SQL_INSERT_PATIENT = " insert into mbs_patients(p_fname,p_lname,p_gender,p_age,p_phone) values(?,?,?,?,?)";
	String SQL_UPDATE_SLOTS = "update mbs_slots set s_status='Booked' where s_id=?";
	String SQL_INSERT_APPOINTMENT = " insert into mbs_appointments(a_ptid,a_docid,a_sid) values(?,?,?)";
	String SQL_GET_DOCTOR_SLOTS = "select * from mbs_slots where s_status='Available' and s_docid=?";

	
	@Autowired
	public DoctorDaoImp(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public ArrayList<Doctor> getAllDoctors() {
		// TODO Auto-generated method stub
		return (ArrayList<Doctor>) jdbcTemplate.query(SQL_GET_DOCTORS, new DoctorMapper());
	}

	@Override
	public ArrayList<DoctorSlots> getSlotsById(int doc_id,int year,int month,int day) {
		String date = year+"-"+month+"-"+day; // Replace with your date string
		String s=LocalDate.of(year, month, day)+"";
		return (ArrayList<DoctorSlots>) jdbcTemplate.query(SQL_GET_SLOTS_BY_ID, new Object[] {doc_id,s},new DoctorSlotsMapper());
	}

	@Override
	public boolean addUser(Users ur) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(SQL_INSERT_USER,ur.getFname(),ur.getLname(),ur.getEmail(),ur.getPassword(),ur.getPhonenumber())>0;
	}

	@Override
	public boolean verifyUser(String email, String pwd) {
		return jdbcTemplate.queryForObject(SQL_VERIFY_USER,
				new Object[] { email, pwd }, Integer.class)>0;
	}

	@Override
	public boolean updateSlots(DoctorSlots ds) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(SQL_UPDATE_SLOTS,ds.getS_id())>0;
	}

	@Override
	public boolean addPatient(Patient pt) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(SQL_INSERT_PATIENT,pt.getFname(),pt.getFname(),pt.getGender(),pt.getAge(),pt.getPhone())>0;
		
	}

	@Override
	public boolean bookAppointment(Patient pt, DoctorSlots ds) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(SQL_INSERT_APPOINTMENT,1,ds.getS_docid(),ds.getS_id())>0;
	}

	@Override
	public ArrayList<DoctorSlots> getSlotsOfDoctor(int doc_id) {
		// TODO Auto-generated method stub
		return (ArrayList<DoctorSlots>) jdbcTemplate.query(SQL_GET_DOCTOR_SLOTS, new Object[] {doc_id},new DoctorSlotsMapper());
	}
	
}