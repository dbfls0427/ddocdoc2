package org.ddocdoc.controller.boardcontroller;

import java.util.List;

import org.ddocdoc.controller.hospitalcontroller.HospitalController;
import org.ddocdoc.service.boardservice.BoardService;
import org.ddocdoc.service.hospitalservice.HospitalService;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	// notice list
	@GetMapping("/noticeList")
	public String noticeList(Model model){
		log.info("notice list~~~~");
		model.addAttribute("list", service.noticeList());
		return "/notice/noticeList";
	}
	
	// notice insert form
	@GetMapping("/noticeInsert")
	public String noticeInsert(){
		log.info("noticeInsert...form");
		return "/notice/noticeInsert";
	}
	
	// notice insert
	@RequestMapping(value="/noticeInsert" , method = {RequestMethod.POST})
	public String noticeInsert(NoticeVO noticeVO, RedirectAttributes rttr){
		
		log.info("=======================================");
		log.info("insert~: "+ noticeVO);
		
		try {
			service.noticeInsert(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addAttribute("not_num", noticeVO.getNot_num());
		
		return "redirect:/board/noticeList";
		
	}
	
	// notice detail
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("not_num") String not_num, Model model){
		log.info("notice Detail~~~~");
		model.addAttribute("noticevo", service.noticeDetail(not_num));
		
		return "/notice/noticeDetail";
	}
	
	// update form
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(@RequestParam("not_num") String not_num,
			Model model){
		
		model.addAttribute("not_num", not_num);
		model.addAttribute("noticevo", service.noticeDetail(not_num));
		
		return "/notice/noticeUpdate";
	}
		
		
	// update
	@RequestMapping(value="/noticeUpdate" , method = {RequestMethod.POST})
	public String noticeUpdate(NoticeVO noticeVO, RedirectAttributes rttr){
		
		try {
			int re = service.noticeUpdate(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("not_num", noticeVO.getNot_num());
		
		return "redirect:/board/noticeList";
	}
		
		
	// delete
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("not_num") String not_num, 
			RedirectAttributes rttr){
		
		service.noticeDelete(not_num);
		
		rttr.addFlashAttribute("not_num", not_num);
		
		return "redirect:/board/noticeList";
	}
			
	
	/*
	// notice insert
	public int noticeInsert(NoticeVO noticeVO);

	// notice list
	public List<NoticeVO> noticeList();

	// notice detail
	public NoticeVO noticeDetail(String not_num);

	// notice update
	public int noticeUpdate(NoticeVO noticeVO);

	// notice delete
	public int noticeDelete(String not_num);
	 * 
	 */
}
