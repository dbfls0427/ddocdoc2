package org.ddocdoc.service.customerservice;

import org.ddocdoc.mapper.customermapper.CustomerMapper;
import org.ddocdoc.vo.customervo.CustomerVO;
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
	}

	@Override
	public CustomerVO loginCustomer(String cus_id) {
		CustomerVO customer = mapper.loginCustomer(cus_id);
		
		return customer;
	}
	
	
	
	
}
