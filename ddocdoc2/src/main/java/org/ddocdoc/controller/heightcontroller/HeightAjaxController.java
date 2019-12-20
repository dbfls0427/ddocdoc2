package org.ddocdoc.controller.heightcontroller;

import java.util.List;

import org.apache.catalina.filters.RestCsrfPreventionFilter;
import org.ddocdoc.service.heightservice.HeightService;
import org.ddocdoc.vo.heightvo.HeightVO;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/heightAjax/*")
@RestController
@Log4j
@AllArgsConstructor
public class HeightAjaxController {
	
	private HeightService service;
	
	//list
	@GetMapping(value = "/list/{ch_num}",
			produces= {MediaType.APPLICATION_XML_VALUE,
					   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<HeightVO>> heightList(@PathVariable("ch_num") String ch_num){
		
		log.info("height list!!!");
		
		return new ResponseEntity<>(service.heightList(ch_num), HttpStatus.OK);
	}
	
	//insert
	 @RequestMapping(value = ("/insert"), produces = {MediaType.TEXT_PLAIN_VALUE}, method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> heightInsert(HeightVO chvo){
		
		log.info("height insert!!!!");
		
		int insertCount = service.heightInsert(chvo);
		
		log.info("height insert count : " + insertCount);
		
		return insertCount ==1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	 
	 //update
	 @RequestMapping(value = ("/update"), produces = {MediaType.TEXT_PLAIN_VALUE}, method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> heightUpdate(HeightVO chvo){
		
		log.info("height update!!!!");
		
		int insertCount = service.updateChildHeight(chvo);
		
		log.info("height update count : " + insertCount);
		
		return insertCount ==1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	 
	//detail
	 @GetMapping(value = "/{he_num}",
			 produces = {MediaType.APPLICATION_XML_VALUE,
					 	 MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public ResponseEntity<HeightVO> heightDetail(@PathVariable("he_num") String he_num){
		 log.info("heightDetail : " +he_num);
		 
		 return new ResponseEntity<>(service.heightDetail(he_num), HttpStatus.OK);
	 }
	 
	 //delete
	 @RequestMapping(value = "/delete/{he_num}", produces={MediaType.TEXT_PLAIN_VALUE},
			 method = {RequestMethod.POST, RequestMethod.GET})
	 public ResponseEntity<String> heightDelete(@PathVariable("he_num") String he_num){
		 log.info("heightDelete : " +he_num);
		
		 return service.heightDelete(he_num) ==1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }

}
