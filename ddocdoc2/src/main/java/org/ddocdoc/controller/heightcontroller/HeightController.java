package org.ddocdoc.controller.heightcontroller;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/height/*")
@Log4j
@AllArgsConstructor
public class HeightController {
	
	@GetMapping("/heightList")
	public String heightList(ChildVO childVO, Model model){
		log.info("heightList에서 " + childVO.getCh_num());
		log.info("heightList에서 " + childVO.getCh_name());
		
		model.addAttribute("ch_num", childVO.getCh_num());
		model.addAttribute("ch_name", childVO.getCh_name());
		/*model.addAttribute("cus_name", CustomerController.allCustomer.getCus_name());*/
		
		return "/height/heightList";
	}
	

}
