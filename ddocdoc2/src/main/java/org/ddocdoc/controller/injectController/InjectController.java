package org.ddocdoc.controller.injectController;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.controller.heightcontroller.HeightController;
import org.ddocdoc.service.heightservice.HeightService;
import org.ddocdoc.service.injectservice.InjectService;
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

@RequestMapping("/inject/*")
@Controller
@Log4j
@AllArgsConstructor
public class InjectController {

	private InjectService service;
	@GetMapping("/injectList")
	public void injectList(@RequestParam("ch_num") String ch_num, Model model){
		
		//inject recommend
		List<InjectInfoVO> list = service.selectInjInfo();
		List<String> injList = service.selectInjList(ch_num);
		
		//for math
		int count = service.injCount(ch_num);
		int total = service.injTotal(ch_num);

		String percent =  Math.round((double) count / (double) total * 100.0) + "%";
		int pc = (int)Math.round((double) count / (double) total * 100.0);

		model.addAttribute("ch_num",ch_num);
		model.addAttribute("list", list);
		model.addAttribute("injList", injList);
		model.addAttribute("percent", percent);
		model.addAttribute("pc", pc);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@GetMapping("/injectInsert")
	public void injectInsert(@RequestParam("ch_num") String ch_num,@RequestParam("inj_name") String inj_name, 
			@RequestParam("inj_content") String inj_content,
			InjectInfoVO infoVO, Model model){
		model.addAttribute("ch_num",ch_num);
		model.addAttribute("inj_name",inj_name);
		model.addAttribute("inj_content",inj_content);
		model.addAttribute("infoVO",infoVO);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@RequestMapping(value=("/insertInjects") , method={RequestMethod.POST})
	public String injectInsert(@RequestParam("ch_num") String ch_num, ChildInjectVO civo, RedirectAttributes rttr){
		System.out.println("여기옴?");
		try {
			service.insertInj(civo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("ch_num",ch_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/inject/injectList";
	}
	
	@GetMapping("/injectDetail")
	public void injectDetail(@RequestParam("ch_num") String ch_num,@RequestParam("inj_name") String inj_name, 
			@RequestParam("inj_content") String inj_content,
			InjectInfoVO infoVO, Model model){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("inj_content", inj_content);
		map.put("ch_num", ch_num);
		
		ChildInjectVO civo = service.selectInjDetail(map);
		
		model.addAttribute("ch_num",ch_num);
		model.addAttribute("inj_name",inj_name);
		model.addAttribute("inj_content",inj_content);
		model.addAttribute("infoVO",infoVO);
		model.addAttribute("civo",civo);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@RequestMapping(value=("/injectUpdate") , method={RequestMethod.POST, RequestMethod.GET})
	public String injectUpdate(@RequestParam("ch_num") String ch_num, ChildInjectVO civo, RedirectAttributes rttr){
		System.out.println("수정폼임?");
		try {
			service.updateInj(civo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("ch_num",ch_num);
		rttr.addFlashAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/inject/injectList";
	}
	
	@GetMapping("/injectDelete")
	public String injectDelete(@RequestParam("ch_num") String ch_num, @RequestParam("inj_content") String inj_content,
			RedirectAttributes rttr){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("inj_content", inj_content);
		map.put("ch_num", ch_num);
		
		service.deleteInj(map);
		
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
