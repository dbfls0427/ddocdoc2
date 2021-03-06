package org.ddocdoc.controller.livecontroller;

import java.util.List;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.liveservice.LiveService;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.livevo.LiveVO;
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

@Controller
@Log4j
@RequestMapping("/live/*")
@AllArgsConstructor
public class LiveController {

	private LiveService service;
	static int count = 0;

	@GetMapping("/mainLive")
	public void mainLive(){
	}
	
	@GetMapping("/insertLive")
	public void insertLive(@RequestParam("hash") String hash,Model model){
		List<String> list = service.selectHos();
		
		model.addAttribute("ind" , "#"+hash);
		model.addAttribute("list", list);
		model.addAttribute("customer", (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@RequestMapping(value="/insertLiveAction", method={RequestMethod.POST})
	public String insertLiveAction(LiveVO live){
		int re = service.insertLive(live);
		System.out.println("성공여부 : " + re);
		
		String hash = live.getLive_address();
		System.out.println(hash);
		
		return "redirect:" + hash;
	}
	
	@GetMapping("/liveList")
	public void liveList(Model model, @RequestParam("cus_num") String cus_num){
		System.out.println("고객번호안넘오오냐? " + cus_num);
		List<LiveVO> live_list = service.liveList();
		List<LiveVO> past_list = service.pastLive(cus_num);
		model.addAttribute("live_list", live_list);
		model.addAttribute("past_list", past_list);
		model.addAttribute("customer" , (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
	
	@GetMapping("/liveUpdate")
	public String liveUpdate(LiveVO live){
		int re = service.liveUpdate(live);
		System.out.println("업데이트 여부 : " + re);
		
		return "redirect:" + live.getLive_address();
	}
	
	@GetMapping("/liveStop")
	public String liveStop(@RequestParam("hash") String hash, 
			@RequestParam("content") String content, Model model, RedirectAttributes rttr){
		
		String live_address = "https://192.168.0.105:3001/conference/#"+hash;
		System.out.println("넘오오는거보자 " +live_address);
		String cus_num = ((CustomerVO)CustomerController.session.getAttribute("customer")).getCus_num();
		int re = 0;
		int re2 = 0;
		//for view
		String view ="";
		System.out.println("content" + content);
		LiveVO live = new LiveVO();
		live.setLive_address(live_address);
		if(count % 2 ==0){
			content = "<div class='panel panel-default'><div class='panel-heading'><h3 class='panel-title'>상담원</h3></div><div class='panel-body'>" + content +"</div></div>";
			count++;
		}else if(count % 2 ==1){
			content = "<div class='panel panel-default'><div class='panel-heading'><h3 class='panel-title'>고객</h3></div><div class='panel-body'>" + content +"</div></div>";
			count++;
		}
		live.setLive_content(content);
		
		if(((CustomerVO)CustomerController.session.getAttribute("admin")) != null){
			re = service.liveStop(live_address);
			re2 = service.cusStop(live);
			view = "redirect:/hospital/admin";
		}else{
			System.out.println("어드민아닌디");
			re = service.cusStop(live);
			re2= service.liveStop(live_address);
			view = "redirect:/live/liveList";
		}
		System.out.println("종료여부 : " +re);
		
		rttr.addAttribute("cus_num",cus_num);
		return view;
	}
	
	@GetMapping("/liveContent")
	public void liveContent(@RequestParam("live_num") String live_num, Model model){
		LiveVO live = service.liveContent(live_num);
		System.out.println("여기는 liveContent");
		System.out.println(live.getLive_content());
		model.addAttribute("live", live);
		model.addAttribute("customer" , (CustomerVO) CustomerController.session.getAttribute("customer"));
	}
}
