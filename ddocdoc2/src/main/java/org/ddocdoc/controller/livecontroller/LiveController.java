package org.ddocdoc.controller.livecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/live/*")
public class LiveController {

	@GetMapping("/mainLive")
	public void mainLive(){
	}
	
	@GetMapping("/insertLive")
	public void liveIndex(@RequestParam("hash") String hash, Model model){
		model.addAttribute("ind" , "#"+hash);
	}
}
