package org.ddocdoc.controller.customercontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ddocdoc.service.customerservice.CustomerService;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙
	@GetMapping("/hospitalResForm")
	public String hospitalResForm(@RequestParam String cus_num, @RequestParam String hos_name, Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		model.addAttribute("hos_name", hos_name);
		return "/res/hos_res";
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙
	@PostMapping("/hospitalRes")
	public String hospitalRes(HospitalResVO hospitalresVO, @RequestParam String hos_name, Model model, RedirectAttributes rttr){
		System.out.println(hos_name);
		String hos_num = service.selectHosNum(hos_name);
		hospitalresVO.setHos_num(hos_num);
		service.insertHospitalRes(hospitalresVO);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		return "redirect:/customer/hospitalResList";
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙트
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
	
	//占쏙옙占쏙옙 占쏢세븝옙占쏙옙
	@GetMapping("/hospitalResDetail")
	public String hospitalResDetail(@RequestParam String hos_res_num, Model model,HttpServletResponse response) throws IOException{
		HospitalResVO res = service.detailRes(hos_res_num);
		String check = service.checkResAcpt(hos_res_num);
		System.out.println("커占쏙옙占쏙옙占� 占쏙옙트占싼뤄옙占쏙옙占쏙옙 hos_res_num : " + hos_res_num);
		System.out.println("check" + check);
		
		if(check.equals("�삁�빟 �젒�닔 ��湲� 以�")){
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('�삁�빟 �젒�닔媛� �븘吏� �릺吏� �븡�븘 ��湲곕쾲�샇 諛쒓툒�씠 �븞�릺�뿀�뒿�땲�떎. �젒�닔媛� �셿猷뚮맆 �븣 源뚯� �옞�떆留� 湲곕떎�젮二쇱꽭�슂.'); location.href='/customer/hospitalResList';</script>");
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
	
	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙
	@GetMapping("/myPageForm")
	public String myPageForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageForm";
	}
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙
	@GetMapping("/myPageUpdateForm")
	public String myPageUpdateForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageUpdateForm";
	}
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	@PostMapping("/myPageUpdate")
	public String myPageUpdate(CustomerVO customer){
		String pw = pwencoder.encode(customer.getCus_pw());
		customer.setCus_pw(pw);
		service.customerUpdate(customer);
		return "/login/loginSuccess";
	}
	
	// 회占쏙옙 탈占쏙옙
	@GetMapping("/myPageDelete")
	public String myPageDelete(@RequestParam String cus_num){
		service.customerDelete(cus_num);
		return "/login/loginForm";
	}
	
	
	
	// 회占쏙옙 占쏙옙
	@GetMapping("/customerDetail")
	public String customerDetail(@RequestParam String cus_num, Model model){
		service.customerDetail(cus_num);
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/detailCustomer";
	}
	
	// 회占쏙옙 占싸그아울옙
	@GetMapping("/logout")
	public String logout(){
		return "/index/index";
	}
	
	
	// 처占쏙옙占쏙옙 占쏢세븝옙占쏙옙
	@GetMapping("/presDetail")
	public String presDetail(@RequestParam String hos_res_num, @RequestParam String hos_num, HttpServletResponse response, Model model) throws IOException{
		PresVO pres = service.presRealDetail(hos_res_num);
		if(pres == null) {
			response.setContentType("text/html; charset=UTF-8");
		     PrintWriter writer = response.getWriter();
		     writer.println("<script>alert('예약 접수가 아직 되지 않아 대기번호 발급이 안되었습니다. 접수가 완료될 때 까지 잠시만 기다려주세요.'); location.href='/customer/hospitalResList';</script>");
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
	public String game(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/game/game";
	}
	
	// map pharmacy
	@PostMapping("/pharSearch")
	public String pharSearch(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/search/pharSearch";
	}
	
	// go to Pharmacy Reservation Form
	@GetMapping("/pharResForm")
	public String pharResForm(@RequestParam String cus_name, @RequestParam String phar_name, Model model){
		model.addAttribute("cus_name", cus_name);
		model.addAttribute("phar_name", phar_name);
		return "/phar_res/pharResForm";
	}
		
	// Reserve Pharmacy
	@PostMapping("/pharRes")
	public String insertPharRes(PharResVO pvo, @RequestParam String cus_num, @RequestParam String phar_name, RedirectAttributes rttr){
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		System.out.println(cus_num);
		rttr.addFlashAttribute("cus_num", cus_num);
		rttr.addFlashAttribute("phar_name", phar_name);
		String phar_num = service.selectPharNum(phar_name);
		// increasePharResWait(phar_num);
		service.increasePharResWait(phar_num);
		pvo.setPhar_num(phar_num);

		service.insertPharRes(pvo);
		
		return "redirect:/customer/hospitalResList";
	}
	
	// Reservation Pharmacy Detail
	@GetMapping("/pharResDetail")
	public String pharResDetail(@RequestParam String phar_num, @RequestParam String phar_res_num, Model model){
		
		PharResVO res = service.pharResDetail(phar_res_num);
		String name = service.selectPharmacyName(phar_num);
		
		model.addAttribute("res", res);
		model.addAttribute("pharName", name);
		model.addAttribute("phar_wait", service.detailPharWait(phar_num));
		
		return "/phar_res/pharDetail";
	}
	

	// chatting
	@GetMapping("/chatting")
	public String chatting(@RequestParam String hos_num, HttpServletResponse response) throws IOException{
		String cus_num = ((CustomerVO)session.getAttribute("customer")).getCus_num();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cus_num", cus_num);
		map.put("hos_num", hos_num);
		service.notifyInsert(map);
		String hos_name = service.hospitalOneName(hos_num);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		 writer.println("<script>alert('"+ hos_name + " 병원에 사전 온라인 상담 예약 완료되었습니다. 담당 의사가 확인할 때까지 기다려주세요.');</script>");
	     writer.flush();
		return "/chatting/chatting";
	}
	
	// pay
	@PostMapping("/payAction")
	public String payAction(@RequestParam String pres_num, @RequestParam String cus_num, @RequestParam String pay_type, RedirectAttributes rttr){
		//model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		PayVO pay = new PayVO();
		pay.setCus_num(cus_num);
		pay.setPay_type(pay_type);
		pay.setPres_num(pres_num);
		
		service.insertPay(pay);
		service.updatePay(pres_num);
		
		return "redirect:/customer/hospitalResList";
	}
	
}
