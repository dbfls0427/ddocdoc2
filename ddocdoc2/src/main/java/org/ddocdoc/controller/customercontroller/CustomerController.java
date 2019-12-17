package org.ddocdoc.controller.customercontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.service.customerservice.CustomerService;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
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
	public String hosSearch(Model model){
		model.addAttribute("customer", allCustomer);
		return "/search/hosSearch";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess(@RequestParam String cus_id, Model model){
		allCustomer = service.loginCustomer(cus_id);
		model.addAttribute("customer", allCustomer);
		return "/login/loginSuccess";
	}
	
	@GetMapping("/joinForm")
	public String joinForm(){
		return "/login/joinForm";
	}
	
	@PostMapping("/joinAction")
	public String joinAction(CustomerVO customer){
		System.out.println("컨트롤러에서 아이디:" + customer.getCus_id());
		String pw = pwencoder.encode(customer.getCus_pw());
		
		customer.setCus_pw(pw);
		System.out.println("컨트롤러에서 " + customer.getCus_pw());
		service.insertCustomer(customer);
		
		return "/login/loginForm";
	}
	
	//병원 예약 폼
	@GetMapping("/hospitalResForm")
	public String hospitalResForm(@RequestParam String cus_num, @RequestParam String hos_name, Model model){
		model.addAttribute("customer", allCustomer);
		model.addAttribute("hos_name", hos_name);
		return "/res/hos_res";
	}
	
	//병원 예약
	@PostMapping("/hospitalRes")
	public String hospitalRes(HospitalResVO hospitalresVO, @RequestParam String hos_name, Model model){
		System.out.println(hos_name);
		String hos_num = service.selectHosNum(hos_name);
		hospitalresVO.setHos_num(hos_num);
		service.insertHospitalRes(hospitalresVO);
		model.addAttribute("customer", allCustomer);
		return "/login/loginSuccess";
	}
	
	//예약 리스트
	@GetMapping("/hospitalResList")
	public String hospitalResList(Model model){
		List<HospitalResVO> list = service.resList(allCustomer.getCus_num());
		List<String> listName = service.detailNameHospital(allCustomer.getCus_num());
		List<PharResVO> pharList2 = service.pharResList(allCustomer.getCus_num());
		List<String> pharNameList2 =service.detailNamePharmacy(allCustomer.getCus_num());
		
		model.addAttribute("list", list);
		model.addAttribute("hosName", listName);
		model.addAttribute("pharList", pharList2);
		model.addAttribute("pharNameList", pharNameList2);
		
		return "/res/resList";
		
	}
	
}
