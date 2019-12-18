package org.ddocdoc.controller.childcontroller;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.childservice.ChildService;
import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.media.sound.ModelAbstractChannelMixer;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/child/*")
@AllArgsConstructor
public class ChildController {
	
	private ChildService service;
	
	//아이 목록
	@GetMapping("/childList")
	public String childList(Model model){
		log.info("child list!!");
		model.addAttribute("childList", service.childList(((CustomerVO)CustomerController.session.getAttribute("customer")).getCus_num()));
		model.addAttribute("customer",(CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "/child/childList";
	}
	
	//아이상세
	@GetMapping("/childDetail")
	public String childDetail(@RequestParam("ch_num") String ch_num, 
			Model model){
		log.info("child detail!!!");

		model.addAttribute("childVO", service.childDetail(ch_num));
		model.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "/child/childDetail";
	}
	
	//아이수정폼
	@GetMapping("/childUpdate")
	public String childUpdate(@RequestParam("ch_num") String ch_num,
			Model model){
		
		model.addAttribute("ch_num",ch_num);
		model.addAttribute("childvo", service.childDetail(ch_num));
		model.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "/child/childUpdate";
	}
	
	//아이수정
	@PostMapping("/childUpdate")
	public String childUpdate(ChildVO childVO, RedirectAttributes rttr){
		
		try {
			int re = service.updateChild(childVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/child/childList";
	}
	
	//아이삭제
	@GetMapping("/childDelete")
	public String childDelete(@RequestParam("ch_num") String ch_num, 
			RedirectAttributes rttr){
		
		service.deleteChild(ch_num);
		
		rttr.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/child/childList";
	}
	
	//아이등록
	@GetMapping("/childInsert")
	public String childInsert(Model model){
		System.out.println("컨트롤러에서 " + ((CustomerVO)CustomerController.session.getAttribute("customer")).getCus_num());
		model.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "/child/childInsert";
		
	}
	
	@PostMapping("/childInsert")
	public String childInsert(ChildVO childVO, RedirectAttributes rttr){
		try {
			System.out.println("000000000000000000000");
			service.insertChild(childVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addAttribute("customer", (CustomerVO)CustomerController.session.getAttribute("customer"));
		
		return "redirect:/child/childList";
	}
	
}
