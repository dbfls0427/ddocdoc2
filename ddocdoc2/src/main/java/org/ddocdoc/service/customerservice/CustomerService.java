package org.ddocdoc.service.customerservice;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;

public interface CustomerService {
	
	public void insertCustomer(CustomerVO customer);
	
	//�α��� ���ǳֱ�
	public CustomerVO loginCustomer(String cus_id);
	
	
}
