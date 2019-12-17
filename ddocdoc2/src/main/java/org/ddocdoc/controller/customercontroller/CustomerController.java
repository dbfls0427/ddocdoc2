package org.ddocdoc.controller.customercontroller;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.service.customerservice.CustomerService;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/*")
@AllArgsConstructor
public class CustomerController {
	
	@Setter(onMethod_ = @Autowired)
	private CustomerService service;
	
	public static CustomerVO allCustomer;
	
	
	@GetMapping("/index")
	public String index(){
		return "/index/index";
	}
	
	@GetMapping("/loginForm")
	public String loginForm(){
		return "/login/loginForm";
	}
	
	@GetMapping("/hosSearch")
	public String hosSearch(){
		
		return "/search/zz";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess(@RequestParam String cus_id, Model model){
		allCustomer = service.loginCustomer(cus_id);
		model.addAttribute("customer", allCustomer);
		return "/login/loginSuccess";
	}
	
	
}
