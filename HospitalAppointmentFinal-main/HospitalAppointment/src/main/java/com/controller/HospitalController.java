package com.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daos.DoctorDao;
import com.models.Doctor;
import com.models.DoctorSlots;
import com.models.Patient;
import com.models.SlotsOnDate;
import com.models.Users;

@Controller
public class HospitalController {
	DoctorDao dd;

	@Autowired
	HospitalController(DoctorDao dd) {
		this.dd = dd;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Users user, Model model) {
		if (dd.addUser(user)) {
			return "about";
		} else {
			return "register";
		}
	}

	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String bookingAppointment(Patient pt, DoctorSlots ds, Model model) {
		if (dd.updateSlots(ds) && dd.addPatient(pt)&& dd.bookAppointment(pt,ds)) {
			model.addAttribute("patient",pt);
			model.addAttribute("dslots",ds);
			return "success";
		} else {
			return "error";
		}
	}
	

	@RequestMapping(value = "/slots", method = RequestMethod.GET)
	public String login(SlotsOnDate sod, Model model) {
		ArrayList<DoctorSlots> doctorSlotList = dd.getSlotsById(sod.getDoc_id(), sod.getYesr(), sod.getMonth(),
				sod.getDay());
		System.out.println(doctorSlotList.size());
		model.addAttribute("doctorSlotList", doctorSlotList);
		return "slots";
	}
	
	//http://localhost:8089/HospitalAppointment/booking?fname=wd&lname=wdw&age=4&phone=08328440211&gender=Male&s_id=1&s_docid=1&s_date=null&s_ftime=08%3A00+AM&s_ttime=09%3A00+AM

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Users user, Model model) {
		if (dd.verifyUser(user.getEmail(), user.getPassword())) {
			ArrayList<Doctor> doctorsList = dd.getAllDoctors();
			model.addAttribute("doctorsList", doctorsList);
			return "home";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String home(Model model) {

		return "about";
	}

	@RequestMapping(value = "/CheckSlots", method = RequestMethod.GET)
	public String checkSlots(Doctor doc, Model model) {
		ArrayList<DoctorSlots> doctorSlotList = dd.getSlotsOfDoctor(doc.getDoc_id());
		model.addAttribute("doctorsList", doctorSlotList);
		return "calender";
	}
}