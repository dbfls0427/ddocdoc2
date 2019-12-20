package org.ddocdoc.controller.pharmacycontroller;

import org.ddocdoc.service.pharmacyservice.PharmacyService;
import org.ddocdoc.vo.pharmacyvo.PharmacyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

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
		
		rttr.addFlashAttribute("pharmacyvo", pharmacyVO.getPhar_num());
		
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
