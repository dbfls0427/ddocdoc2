package org.ddocdoc.controller.hospitalcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/hospital/*")
@AllArgsConstructor
public class HospitalController {
	
	// list
	@GetMapping("/hospitalList")
	public String hospitalList(){
		log.info("hospitalList");
		
		return "/hospital/hospitalList";
	}
	
	// insert
	@GetMapping("/hospitalInsert")
	public String hospitalInsert(){
		log.info("hospitalInset...form");
		return "/hospital/hospitalInsert";
	}
}
