package org.ddocdoc.controller.heightcontroller;

import java.util.List;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.heightservice.HeightService;
import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.heightvo.HeightVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/height/*")
@Controller
@Log4j
@AllArgsConstructor
public class HeightController {
	
	private HeightService service;
	
	//list
	@GetMapping("/heightList")
	public void heightList(HeightVO heightVO, Model model){
		model.addAttribute("ch_num", heightVO.getCh_num());
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
		System.out.println("controller v: " +heightVO.getCh_num());
				
	}
	
	//insert
	@GetMapping("/heightInsert")
	public void heightInsert(@RequestParam("ch_num") String ch_num, Model model){
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
		model.addAttribute("ch_num", ch_num);
	}
	
	//detail
	@GetMapping("/heightDetail")
	public void heightDetail(@RequestParam("he_num") String he_num, Model model){
		model.addAttribute("he_num",he_num);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	

}
