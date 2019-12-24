package org.ddocdoc.controller.checkupController;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.controller.heightcontroller.HeightController;
import org.ddocdoc.service.checkupservice.CheckupService;
import org.ddocdoc.service.heightservice.HeightService;
import org.ddocdoc.service.injectservice.InjectService;
import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.injectvo.ChildInjectVO;
import org.ddocdoc.vo.injectvo.InjectInfoVO;
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

@RequestMapping("/checkup/*")
@Controller
@Log4j
@AllArgsConstructor
public class CheckupController {

	private CheckupService service;
	
	@GetMapping("/checkupList")
	public void checkupList(@RequestParam("ch_num") String ch_num, Model model){
		
		//checkup recommend
		/*List<InjectInfoVO> list = service.selectInjInfo();
		List<String> injList = service.selectInjList(ch_num);*/
		List<CheckupInfoVO> list = service.selectCheInfo();
		List<String> cheList = service.selectCheList(ch_num);
		
		//for math
		int count = service.cheCount(ch_num);
		int total = service.cheTotal(ch_num); 

		String percent =  Math.round((double) count / (double) total * 100.0) + "%";
		int pc = (int)Math.round((double) count / (double) total * 100.0);

		model.addAttribute("ch_num",ch_num);
		model.addAttribute("list", list);
		model.addAttribute("cheList", cheList);
		model.addAttribute("percent", percent);
		model.addAttribute("pc", pc);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@GetMapping("/checkupInsert")
	public void checkupInsert(@RequestParam("ch_num") String ch_num,@RequestParam("che_name") String che_name, 
			@RequestParam("cup_content") String cup_content,
			CheckupInfoVO infoVO, Model model){
		model.addAttribute("ch_num",ch_num);
		model.addAttribute("che_name",che_name);
		model.addAttribute("cup_content",cup_content);
		model.addAttribute("infoVO",infoVO);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@RequestMapping(value=("/insertChe") , method={RequestMethod.POST})
	public String CheckupInsert(@RequestParam("ch_num") String ch_num, ChildCheckupVO ccvo, RedirectAttributes rttr){
		System.out.println("checkup! insert!");
		try {
			service.insertChe(ccvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("ch_num",ch_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/checkup/checkupList";
	}
	
	@GetMapping("/checkupDetail")
	public void checkupDetail(@RequestParam("ch_num") String ch_num,@RequestParam("che_name") String che_name, 
			@RequestParam("cup_content") String cup_content,
			CheckupInfoVO infoVO, Model model){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cup_content", cup_content);
		map.put("ch_num", ch_num);
		log.info("컨트롤러 검진 나오나");
		
		ChildCheckupVO ccvo = service.selectCheDetail(map);
		
		model.addAttribute("ch_num",ch_num);
		model.addAttribute("che_name", che_name);
		model.addAttribute("cup_content", cup_content);
		model.addAttribute("infoVO",infoVO);
		model.addAttribute("ccvo",ccvo);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@RequestMapping(value=("/checkupUpdate") , method={RequestMethod.POST, RequestMethod.GET})
	public String checkupUpdate(@RequestParam("ch_num") String ch_num, ChildCheckupVO ccvo, RedirectAttributes rttr){
		System.out.println("checkup! update!!");
		try {
			service.updateChe(ccvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("ch_num",ch_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/checkup/checkupList";
	}
	
	@GetMapping("/checkupDelete")
	public String checkupDelete(@RequestParam("ch_num") String ch_num, @RequestParam("cup_content") String cup_content,
			RedirectAttributes rttr){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cup_content", cup_content);
		map.put("ch_num", ch_num);
		
		service.deleteChe(map); 
		
		rttr.addAttribute("ch_num",ch_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/inject/injectList";
	}
	
	@GetMapping("/injSearch")
	public String pharSearch(Model model){
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
		
		return "/search/injSearch";
	}
	
	
}
