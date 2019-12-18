package org.ddocdoc.service.customerservice;

import java.util.List;

import org.ddocdoc.mapper.customermapper.CustomerMapper;
import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {
	
	@Setter(onMethod_=@Autowired)
	private CustomerMapper mapper;

	@Override
	public void insertCustomer(CustomerVO customer) {
		log.info("insert..." + customer);

		mapper.insertCustomer(customer);
		String cus_num = mapper.cusNumSelect(customer.getCus_id());
		CustomerAuthVO auth = new CustomerAuthVO();
		auth.setCus_num(cus_num);
		auth.setCus_id(customer.getCus_id());
		auth.setAuth("ROLE_MEMBER");
		mapper.insertCustomerAuth(auth);
		
	}

	@Override
	public CustomerVO loginCustomer(String cus_id) {
		CustomerVO customer = mapper.loginCustomer(cus_id);
		
		return customer;
	}

	@Override
	public String selectHosNum(String hos_name) {
		System.out.println("서비스에서 : " + hos_name);
		
		return mapper.selectHosNum(hos_name);
	}

	@Override
	public void insertHospitalRes(HospitalResVO hospitalresVO) {
		mapper.insertHospitalRes(hospitalresVO);
		
		
	}

	@Override
	public List<HospitalResVO> resList(String cus_num) {
		
		return mapper.resList(cus_num);
	}

	@Override
	public List<String> detailNameHospital(String cus_num) {
		return mapper.detailNameHospital(cus_num);
	}

	@Override
	public List<PharResVO> pharResList(String cus_num) {
		return mapper.pharResList(cus_num);
	}

	@Override
	public List<String> detailNamePharmacy(String cus_num) {
		return mapper.detailNamePharmacy(cus_num);
	}

	@Override
	public HospitalResVO detailRes(String hos_res_num) {
		return mapper.detailRes(hos_res_num);
	}

	@Override
	public String checkResAcpt(String hos_res_num) {
		return mapper.checkResAcpt(hos_res_num);
	}

	@Override
	public int detailWait(String hos_res_num) {
		return mapper.detailWait(hos_res_num);
	}

	@Override
	public int customerUpdate(CustomerVO customer) {
		return mapper.customerUpdate(customer);
	}

	@Override
	public int customerDelete(String cus_num) {
		return mapper.customerDelete(cus_num);
	}
	
	
	
	
	
	
	
	
}
