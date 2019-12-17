package org.ddocdoc.service.customerservice;

import java.util.List;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.pharresvo.PharResVO;

public interface CustomerService {
	
	public void insertCustomer(CustomerVO customer);
	
	//로그인 세션넣기
	public CustomerVO loginCustomer(String cus_id);
	
	// 병원 번호 가져오기
	public String selectHosNum(String hos_name);
	
	// 병원 예약
	public void insertHospitalRes(HospitalResVO hospitalresVO);
	
	// 예약 리스트
	public List<HospitalResVO> resList(String cus_num);
	
	// 병원 이름 추출
	public List<String> detailNameHospital(String cus_num);
	
	//약국 예약 리스트
	public List<PharResVO> pharResList(String cus_num);
	
	//약국 이름 가져오기
	public List<String> detailNamePharmacy(String cus_num);
	
}
