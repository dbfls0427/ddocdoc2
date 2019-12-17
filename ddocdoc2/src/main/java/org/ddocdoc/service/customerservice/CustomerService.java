package org.ddocdoc.service.customerservice;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;

public interface CustomerService {
	
	public void insertCustomer(CustomerVO customer);
	
	//로그인 세션넣기
	public CustomerVO loginCustomer(String cus_id);
	
	
}
