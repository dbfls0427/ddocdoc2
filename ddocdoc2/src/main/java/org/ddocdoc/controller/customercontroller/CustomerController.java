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
import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.communityvo.CommunityVO;
import org.ddocdoc.vo.communityvo.Criteria;
import org.ddocdoc.vo.communityvo.PageDTO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.termvo.Criteria2;
import org.ddocdoc.vo.termvo.PageDTO2;
import org.ddocdoc.vo.termvo.TermVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
	@GetMapping("/hospitalResForm")
	public String hospitalResForm(@RequestParam String cus_num, @RequestParam String hos_name, Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		model.addAttribute("hos_name", hos_name);
		return "/res/hos_res";
	}
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	@PostMapping("/hospitalRes")
	public String hospitalRes(HospitalResVO hospitalresVO, @RequestParam String hos_name, Model model, RedirectAttributes rttr){
		System.out.println(hos_name);
		String hos_num = service.selectHosNum(hos_name);
		hospitalresVO.setHos_num(hos_num);
		service.insertHospitalRes(hospitalresVO);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		return "redirect:/customer/hospitalResList";
	}
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�듃
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
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룫�꽭釉앹삕�뜝�룞�삕
	@GetMapping("/hospitalResDetail")
	public String hospitalResDetail(@RequestParam String hos_res_num, Model model,HttpServletResponse response) throws IOException{
		HospitalResVO res = service.detailRes(hos_res_num);
		String check = service.checkResAcpt(hos_res_num);
		System.out.println("check" + check);
		
		if(check.equals("예약 접수 대기 중") || service.detailWait(hos_res_num) == 0){
			model.addAttribute("res", res);
			model.addAttribute("hos_res_num", hos_res_num);
			model.addAttribute("cus_name", ((CustomerVO)session.getAttribute("customer")).getCus_name());
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
//            out.println("<script>alert('�삁�빟 �젒�닔媛� �븘吏� �릺吏� �븡�븘 ��湲곕쾲�샇 諛쒓툒�씠 �븞�릺�뿀�뒿�땲�떎. �젒�닔媛� �셿猷뚮맆 �븣 源뚯� �옞�떆留� 湲곕떎�젮二쇱꽭�슂.'); location.href='/customer/hospitalResList';</script>");
            out.println("<script>alert('예약 접수가 아직 되지 않아 대기번호 발급이 안되었습니다. 접수가 완료될 때 까지 잠시만 기다려주세요.');</script>");
            out.flush();
			return "/res/resDetail";
		}else{
			int count = service.detailWait(hos_res_num);
			model.addAttribute("res", res);
			model.addAttribute("cus_name", ((CustomerVO)session.getAttribute("customer")).getCus_name());
			model.addAttribute("count", count);
			return "/res/resDetail";
		}
		
		
	}
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
	@GetMapping("/myPageForm")
	public String myPageForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageForm";
	}
	
	// �쉶�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
	@GetMapping("/myPageUpdateForm")
	public String myPageUpdateForm(Model model){
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/myPageUpdateForm";
	}
	
	// �쉶�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	@PostMapping("/myPageUpdate")
	public String myPageUpdate(CustomerVO customer){
		String pw = pwencoder.encode(customer.getCus_pw());
		customer.setCus_pw(pw);
		service.customerUpdate(customer);
		return "/login/loginSuccess";
	}
	
	// �쉶�뜝�룞�삕 �깉�뜝�룞�삕
	@GetMapping("/myPageDelete")
	public String myPageDelete(@RequestParam String cus_num){
		service.customerDelete(cus_num);
		return "/login/loginForm";
	}
	
	
	
	// �쉶�뜝�룞�삕 �뜝�룞�삕
	@GetMapping("/customerDetail")
	public String customerDetail(@RequestParam String cus_num, Model model){
		service.customerDetail(cus_num);
		model.addAttribute("customer", (CustomerVO)session.getAttribute("customer"));
		return "/myPage/detailCustomer";
	}
	
	// �쉶�뜝�룞�삕 �뜝�떥洹몄븘�슱�삕
	@GetMapping("/logout")
	public String logout(){
		session.removeAttribute("customer");
		return "/index/index";
	}
	
	
	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룫�꽭釉앹삕�뜝�룞�삕
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
		 writer.println("<script>alert('"+ hos_name + " 蹂묒썝�뿉 �궗�쟾 �삩�씪�씤 �긽�떞 �삁�빟 �셿猷뚮릺�뿀�뒿�땲�떎. �떞�떦 �쓽�궗媛� �솗�씤�븷 �븣源뚯� 湲곕떎�젮二쇱꽭�슂.');</script>");
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
	
	// delete (cancel) Hospital Reservation
	@GetMapping("/deleteRes")
	public String deleteRes(@RequestParam String hos_res_num, @RequestParam String hos_num,RedirectAttributes rttr, HttpServletResponse response) throws IOException{
		
		HospitalResVO res = service.detailRes(hos_res_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		rttr.addFlashAttribute("hos_res_num", hos_res_num);
		rttr.addFlashAttribute("hos_num", hos_num);
		rttr.addFlashAttribute("res", res);
		
		String check = service.checkResAcpt(hos_res_num);
		System.out.println("check" + check);
		
		if(check.equals("예약 접수 대기 중")){
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('예약 취소가 완료되었습니다.');location.href='/customer/hospitalResList';</script>");
            out.flush();
            service.deleteRes(hos_res_num);
            return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('대기번호가 이미 발급되어 예약 취소가 불가능합니다. 해당 병원에 문의하셔서 예약 취소를 해주세요.');location.href='/customer/hospitalResList';</script>");
			writer.flush();
			return null;
		}
		
		
	
	}
	
	
	@GetMapping("/comInsertForm")
	public String comInsertForm(Model model){
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		model.addAttribute("customer", customer);
		return "/community/comInsert";
	}
	
	@PostMapping("/comInsert")
	public String comInsert(CommunityVO com){
		service.comInsert(com);
		return "redirect:/customer/comList";
	}
	
	@GetMapping("/comList")
	public String comList(Criteria cri, Model model){
		List<CommunityVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
		return "/community/comList";
	}

	
	@GetMapping("/comDetail")
	public String comDetail(@RequestParam("com_num") String com_num, @ModelAttribute("cri") Criteria cri,Model model){
		CommunityVO com = service.comDetail(com_num);
		model.addAttribute("com", com);
		return "/community/comDetail";
	}
	
	@GetMapping("/comUpdateForm")
	public String comUpdateForm(@RequestParam("com_num") String com_num, @ModelAttribute("cri") Criteria cri, Model model){
		CommunityVO com = service.comDetail(com_num);
		model.addAttribute("com", com);
		model.addAttribute("cri", cri);
		return "/community/comUpdateForm";
	}
	
	@PostMapping("/comUpdate")
	public String comUpdate(CommunityVO com, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr){
		service.comUpdate(com);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/customer/comList";
	}
	
	@GetMapping("/comDelete")
	public String comDelete(@RequestParam("com_num") String com_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){
		service.comDelete(com_num);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/customer/comList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model){
		List<NoticeVO> list = service.noticeList();
		
		model.addAttribute("list", list);
		return "/service/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("not_num") String not_num, Model model){
		NoticeVO noticevo = service.noticeDetail(not_num);
		model.addAttribute("noticevo", noticevo);
		return "/service/noticeDetail";
	}
	
	@GetMapping("/askList")
	public String askList(Model model){
		List<AskVO> list = service.askList();
		
		model.addAttribute("list", list);
		return "/service/askList";
	}
	
	@GetMapping("/termList")
	public String termList(Criteria2 cri2, Model model){
		List<TermVO> list = service.termList(cri2);
		
		int total = service.getTotalCount2(cri2);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO2(cri2, total));
		
		
		return "/service/termList";
	}
	
	@GetMapping("/termDetail")
	public String termDetail(@RequestParam("term_num") String term_num, Model model){
		TermVO termvo = service.termDetail(term_num);
		model.addAttribute("termvo", termvo);
		return "/service/termDetail";
	}
	
	@GetMapping("/machine")
	public String machine(){
		return "/teachableMachine/teachable";
	}
	
}
