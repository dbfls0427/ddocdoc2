package org.ddocdoc.controller.customercontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	public static HttpSession session;
		
	
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
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/search/hosSearch";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess( Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
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
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
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
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/login/loginSuccess";
	}
	
	//예약 리스트
	@GetMapping("/hospitalResList")
	public String hospitalResList(Model model){
		System.out.println("dddd" + ((CustomerVO)session.getAttribute("customer")).getCus_num());
		List<HospitalResVO> list = service.resList(((CustomerVO)session.getAttribute("customer")).getCus_num());
		List<String> listName = service.detailNameHospital(((CustomerVO)session.getAttribute("customer")).getCus_num());
		List<PharResVO> pharList2 = service.pharResList(((CustomerVO)session.getAttribute("customer")).getCus_num());
		List<String> pharNameList2 =service.detailNamePharmacy(((CustomerVO)session.getAttribute("customer")).getCus_num());
		
		model.addAttribute("list", list);
		model.addAttribute("hosName", listName);
		model.addAttribute("pharList", pharList2);
		model.addAttribute("pharNameList", pharNameList2);
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		
		return "/res/resList";
		
	}
	
	//예약 상세보기
	@GetMapping("/hospitalResDetail")
	public String hospitalResDetail(@RequestParam String hos_res_num, Model model,HttpServletResponse response) throws IOException{
		HospitalResVO res = service.detailRes(hos_res_num);
		String check = service.checkResAcpt(hos_res_num);
		
		if(check.equals("예약 접수 대기 중")){
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('예약 접수가 아직 되지 않아 대기번호 발급이 안되었습니다. 접수가 완료될 때 까지 잠시만 기다려주세요.'); location.href='/customer/hospitalResList';</script>");
            out.flush();
			return null;
		}else{
			int count = service.detailWait(hos_res_num);
			model.addAttribute("res", res);
			model.addAttribute("cus_name", ((CustomerVO)session.getAttribute("customer")).getCus_name());
			model.addAttribute("count", count);
			return "/res/resDetail";
		}
		
		
	}
	
	// 마이페이지 폼
	@GetMapping("/myPageForm")
	public String myPageForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageForm";
	}
	
	// 회원 수정 폼
	@GetMapping("/myPageUpdateForm")
	public String myPageUpdateForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageUpdateForm";
	}
	
}
