package org.ddocdoc.service.customerservice;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;

public interface CustomerService {
	
	public void insertCustomer(CustomerVO customer);
	
	//로그인 세션넣기
	public CustomerVO loginCustomer(String cus_id);
	
	// 병원 번호 가져오기
	public String selectHosNum(String hos_name);
	
	// 병원 예약
	public void insertHospitalRes(HospitalResVO hospitalresVO);
	
}
