package org.ddocdoc.controller.replycontroller;

import java.util.List;

import org.ddocdoc.service.replyservice.ReplyService;
import org.ddocdoc.vo.replyvo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/*")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	/*@PostMapping(value = "/new", consumes = "application/json", produces={MediaType.TEXT_PLAIN_VALUE})*/
	@RequestMapping(value = "/new", consumes="application/json",produces = {MediaType.TEXT_PLAIN_VALUE}, method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rep){
		log.info("여긴 오나");
		int insertCount = service.replyInsert(rep);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@GetMapping(value = "/pages/{com_num}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("com_num") String com_num ){
		return new ResponseEntity<List<ReplyVO>>(service.replyList(com_num), HttpStatus.OK);
		
	}
	
	/*@GetMapping(value = "/{rep_num}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> replyDetail(@PathVariable("rep_num") int rep_num){
		return new ResponseEntity<ReplyVO>(service.replyDetail(rep_num), HttpStatus.OK);
	}*/
	
	
	@GetMapping(value = "/{rep_num}", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyDelete(@PathVariable("rep_num") int rep_num){
		return service.replyDelete(rep_num)==1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{rep_num}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyUpdate(@RequestBody ReplyVO rep, @PathVariable("rep_num") int rep_num){
		rep.setRep_num(rep_num);
		
		return service.replyUpdate(rep) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
