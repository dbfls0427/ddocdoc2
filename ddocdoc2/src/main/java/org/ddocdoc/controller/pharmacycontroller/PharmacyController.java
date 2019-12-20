package org.ddocdoc.controller.pharmacycontroller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.hospitalservice.HospitalService;
import org.ddocdoc.service.pharmacyservice.PharmacyService;
import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.pharmacyvo.PharmacyVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@Controller
@Log4j
@RequestMapping("/pharmacy/*")
@AllArgsConstructor
public class PharmacyController {
	
	private PharmacyService service;
	
	// insert form
	@GetMapping("/pharmacyInsert")
	public String pharmacyInsert(){
		log.info("pharmacyInsert...form");
		return "/pharmacy/pharmacyInsert";
	}
	
	// insert
	@RequestMapping(value="/pharmacyInsert" , method = {RequestMethod.POST})
	public String pharmacyInsert(PharmacyVO pharmacyVO, RedirectAttributes rttr){
		log.info("insert~: "+ pharmacyVO);
		
		try {
			service.pharmacyInsert(pharmacyVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("phar_num", pharmacyVO.getPhar_num());
		
		return "redirect:/pharmacy/pharmacyList";
		
	}
	
	// list
	@GetMapping("/pharmacyList")
	public String pharmacyList(Model model){
		log.info("pharmacyList~~~~~");
		
		model.addAttribute("list", service.pharmacyList());
		
		return "/pharmacy/pharmacyList";
	}
	
	// Detail
	@GetMapping("/pharmacyDetail")
	public String pharmacyDetail(@RequestParam("phar_num") String phar_num, Model model){
		log.info("pharmacy Detail");
		model.addAttribute("pharmacyvo", service.pharmacyDetail(phar_num));
		
		return "/pharmacy/pharmacyDetail";
	}

	// update form
	@GetMapping("/pharmacyUpdate")
	public String hospitalUpdate(@RequestParam("phar_num") String phar_num,
			Model model){
		
		model.addAttribute("phar_num", phar_num);
		model.addAttribute("pharmacyvo", service.pharmacyDetail(phar_num));
		
		return "/pharmacy/pharmacyUpdate";
	}
		
	
	// update
	@RequestMapping(value="/pharmacyUpdate" , method = {RequestMethod.POST})
	public String pharmacyUpdate(PharmacyVO pharmacyVO, RedirectAttributes rttr){
		
		try {
			int re = service.pharmacyUpdate(pharmacyVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("phar_num", pharmacyVO.getPhar_num());
		
		return "redirect:/pharmacy/pharmacyList";
	}
		
		
		// delete
		@GetMapping("/pharmacyDelete")
		public String hospitalDelete(@RequestParam("phar_num") String phar_num, 
				RedirectAttributes rttr){
			        
			service.pharmacyDelete(phar_num);
			
			rttr.addFlashAttribute("phar_num", phar_num);
			
			return "redirect:/pharmacy/pharmacyList";
		}
			
	
	
	
}
