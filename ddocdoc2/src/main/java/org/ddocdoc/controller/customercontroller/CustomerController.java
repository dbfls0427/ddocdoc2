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
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
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
		String pw = pwencoder.encode(customer.getCus_pw());
		customer.setCus_pw(pw);
		service.insertCustomer(customer);
		
		return "/login/loginForm";
	}
	
	//���� ���� ��
	@GetMapping("/hospitalResForm")
	public String hospitalResForm(@RequestParam String cus_num, @RequestParam String hos_name, Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		model.addAttribute("hos_name", hos_name);
		return "/res/hos_res";
	}
	
	//���� ����
	@PostMapping("/hospitalRes")
	public String hospitalRes(HospitalResVO hospitalresVO, @RequestParam String hos_name, Model model){
		System.out.println(hos_name);
		String hos_num = service.selectHosNum(hos_name);
		hospitalresVO.setHos_num(hos_num);
		service.insertHospitalRes(hospitalresVO);
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/login/loginSuccess";
	}
	
	//���� ����Ʈ
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
	
	//���� �󼼺���
	@GetMapping("/hospitalResDetail")
	public String hospitalResDetail(@RequestParam String hos_res_num, Model model,HttpServletResponse response) throws IOException{
		HospitalResVO res = service.detailRes(hos_res_num);
		String check = service.checkResAcpt(hos_res_num);
		System.out.println("Ŀ����� ��Ʈ�ѷ����� hos_res_num : " + hos_res_num);
		System.out.println("check" + check);
		
		if(check.equals("���� ���� ��� ��")){
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
	
	// ���������� ��
	@GetMapping("/myPageForm")
	public String myPageForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageForm";
	}
	
	// ȸ�� ���� ��
	@GetMapping("/myPageUpdateForm")
	public String myPageUpdateForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageUpdateForm";
	}
	
	// ȸ�� ���� ����
	@PostMapping("/myPageUpdate")
	public String myPageUpdate(CustomerVO customer){
		String pw = pwencoder.encode(customer.getCus_pw());
		customer.setCus_pw(pw);
		service.customerUpdate(customer);
		return "/login/loginSuccess";
	}
	
	// ȸ�� Ż��
	@GetMapping("/myPageDelete")
	public String myPageDelete(@RequestParam String cus_num){
		service.customerDelete(cus_num);
		return "/login/loginForm";
	}
	
	// ���� ���
	@GetMapping("/admin")
	public String admin(){
		return "/index/admin";
	}
	
	// ȸ�� ��
	@GetMapping("/customerDetail")
	public String customerDetail(@RequestParam String cus_num, Model model){
		service.customerDetail(cus_num);
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/detailCustomer";
	}
	
	// ȸ�� �α׾ƿ�
	@GetMapping("/logout")
	public String logout(){
		return "/index/index";
	}
	
	
	// ó���� �󼼺���
	@GetMapping("/presDetail")
	public String presDetail(@RequestParam String hos_res_num, @RequestParam String hos_num, HttpServletResponse response, Model model) throws IOException{
		PresVO pres = service.presRealDetail(hos_res_num);
		if(pres == null) {
			response.setContentType("text/html; charset=UTF-8");
		     PrintWriter writer = response.getWriter();
		     writer.println("<script>alert('처방전이 등록되지 않았습니다. 진료 현황을 확인해주세요.'); location.href='/customer/hospitalResList';</script>");
		     writer.flush();
			return null;
		}
		
		String pres_num = pres.getPres_num();
		List<PresDetailVO> list = service.cusPresDetailList(pres_num);
		List<String> list2 = service.cusPresDetailMedName(pres_num);
		String check = service.selectPayCheck(pres_num);
		int price = service.selectPayPrice(hos_res_num);
		
		HospitalVO hos = service.detailHospital(hos_num);
		String hos_name = hos.getHos_name();
		
		model.addAttribute("pres", pres);
		model.addAttribute("cus_name", ((CustomerVO)session.getAttribute("customer")).getCus_name());
		model.addAttribute("hos_name", hos_name);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("check", check);
		model.addAttribute("price", price);
		
		return "/pres/presDetail";
	}
	
	@GetMapping("/game")
	public String game(){
		return "/game/game";
	}
	
}
