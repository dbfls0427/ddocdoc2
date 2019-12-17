package org.ddocdoc.service.customerservice;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;

public interface CustomerService {
	
	public void insertCustomer(CustomerVO customer);
	
	//�α��� ���ǳֱ�
	public CustomerVO loginCustomer(String cus_id);
	
	// ���� ��ȣ ��������
	public String selectHosNum(String hos_name);
	
	// ���� ����
	public void insertHospitalRes(HospitalResVO hospitalresVO);
	
}
