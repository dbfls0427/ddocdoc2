package org.ddocdoc.video;

import org.ddocdoc.controller.childcontroller.ChildController;
import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/video/*")
public class beautyTV {

	@GetMapping("/beautyVideo")
	public void beautyVideo(Model model){
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
}
