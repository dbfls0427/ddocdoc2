package org.ddocdoc.controller.gamecontroller;

import org.ddocdoc.service.customerservice.CustomerService;
import org.ddocdoc.vo.symptomdetailvo.SymptomDetailVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

@RequestMapping("/game/")
@RestController
@Log4j
@AllArgsConstructor
public class GameController {
	
	@Setter(onMethod_=@Autowired)
	private CustomerService service;
	
	
	/*@PostMapping(value = "/symptomInsert", consumes = "application/json"
	, produces = {MediaType.TEXT_PLAIN_VALUE})*/
	
	@RequestMapping(value = "/symptomInsert", consumes="application/json",produces = {MediaType.TEXT_PLAIN_VALUE}, method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity<String> symptomInsert(@RequestBody SymptomVO sym ){
		log.info(sym);
		
		int insertCount = service.symptomInsert(sym);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value = "/{cus_num}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SymptomDetailVO> symptomDetail(@PathVariable("cus_num") String cus_num){
		log.info("get : " + cus_num);
		
		return new ResponseEntity<SymptomDetailVO>(service.symptomDetail(cus_num), HttpStatus.OK);
	}
	

}
