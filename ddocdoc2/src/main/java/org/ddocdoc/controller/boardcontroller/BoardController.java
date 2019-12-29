package org.ddocdoc.controller.boardcontroller;

import java.util.List;

import org.ddocdoc.controller.hospitalcontroller.HospitalController;
import org.ddocdoc.service.boardservice.BoardService;
import org.ddocdoc.service.hospitalservice.HospitalService;
import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.ddocdoc.vo.termvo.Criteria;
import org.ddocdoc.vo.termvo.PageDTO;
import org.ddocdoc.vo.termvo.TermVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// notice update form
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(@RequestParam("not_num") String not_num,
			Model model){
		
		model.addAttribute("not_num", not_num);
		model.addAttribute("noticevo", service.noticeDetail(not_num));
		
		return "/notice/noticeUpdate";
	}
		
		
	// notice update
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
		
		
	// notice delete
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("not_num") String not_num, 
			RedirectAttributes rttr){
		
		service.noticeDelete(not_num);
		
		rttr.addFlashAttribute("not_num", not_num);
		
		return "redirect:/board/noticeList";
	}
			
	
	// AnQ list
	@GetMapping("/askList")
	public String askList(Model model){
		log.info("ask list~~~~");
		model.addAttribute("list", service.askList());
		return "/ask/askList";
	}
	
	// AnQ insert form
	@GetMapping("/askInsert")
	public String askInsert(){
		log.info("askInsert...form");
		return "/ask/askInsert";
	}
	
	// AnQ insert
	@RequestMapping(value="/askInsert" , method = {RequestMethod.POST})
	public String askInsert(AskVO askVO, RedirectAttributes rttr){
		
		log.info("=======================================");
		log.info("insert~: "+ askVO);
		
		try {
			service.askInsert(askVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addAttribute("ask_num", askVO.getAsk_num());
		
		return "redirect:/board/askList";
		
	}
	
	// AnQ detail
	@GetMapping("/askDetail")
	public String askDetail(@RequestParam("ask_num") String ask_num, Model model){
		log.info("ask Detail~~~~");
		model.addAttribute("askvo", service.askDetail(ask_num));
		
		return "/ask/askDetail";
	}
		
	// AnQ update form
	@GetMapping("/askUpdate")
	public String askUpdate(@RequestParam("ask_num") String ask_num,
			Model model){
		
		model.addAttribute("ask_num", ask_num);
		model.addAttribute("askvo", service.askDetail(ask_num));
		
		return "/ask/askUpdate";
	}
		
		
	// AnQ update
	@RequestMapping(value="/askUpdate" , method = {RequestMethod.POST})
	public String askUpdate(AskVO askVO, RedirectAttributes rttr){
		
		try {
			int re = service.askUpdate(askVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("ask_num", askVO.getAsk_num());
		
		return "redirect:/board/askList";
	}
		
		
	// AnQ delete
	@GetMapping("/askDelete")
	public String askDelete(@RequestParam("ask_num") String ask_num, 
			RedirectAttributes rttr){
		
		service.askDelete(ask_num);
		
		rttr.addFlashAttribute("ask_num", ask_num);
		
		return "redirect:/board/askList";
	}
	
	// term list
	/*
	@GetMapping("/termList")
	public String termList(Model model){
		log.info("term list~~~~");
		model.addAttribute("list", service.termList());
		return "/term/termList";
	}
	*/
	@GetMapping("/termList")
	public String termList(Criteria cri, Model model){
		log.info("list~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~: " + cri);
		model.addAttribute("list", service.termList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
		int total = service.getTotalCount(cri);
		log.info("total:"+total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/term/termList";
	}
	
	// term insert form
	@GetMapping("/termInsert")
	public String termInsert(){
		log.info("termInsert...form");
		return "/term/termInsert";
	}
	
	// term insert
	@RequestMapping(value="/termInsert" , method = {RequestMethod.POST})
	public String termInsert(TermVO termVO, RedirectAttributes rttr){
		
		log.info("=======================================");
		log.info("insert~: "+ termVO);
		
		try {
			service.termInsert(termVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addAttribute("term_num", termVO.getTerm_num());
		
		return "redirect:/board/termList";
		
	}
	
	// term detail
	@GetMapping("/termDetail")
	public String termDetail(@RequestParam("term_num") String term_num, @ModelAttribute("cri") Criteria cri, Model model){
		log.info("term Detail~~~~");
		//model.addAttribute("cri", cri);
		model.addAttribute("termvo", service.termDetail(term_num));
		
		return "/term/termDetail";
	}
	
	// term update form
	@GetMapping("/termUpdate")
	public String termUpdate(@RequestParam("term_num") String term_num,
			@ModelAttribute("cri") Criteria cri,
			Model model){
		
		model.addAttribute("term_num", term_num);
		model.addAttribute("termvo", service.termDetail(term_num));
		//model.addAttribute("cri", cri);
		
		
		return "/term/termUpdate";
	}
		
		
	// term  update
	@RequestMapping(value="/termUpdate" , method = {RequestMethod.POST})
	public String termUpdate(TermVO termVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){
		
		try {
			int re = service.termUpdate(termVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("term_num", termVO.getTerm_num());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/termList";
	}
		
		
	// term  delete
	@GetMapping("/termDelete")
	public String termDelete(@RequestParam("term_num") String term_num, 
			@ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr){
		
		service.termDelete(term_num);
		
		rttr.addFlashAttribute("term_num", term_num);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/termList";
	}
				
				
		
	
	
}
