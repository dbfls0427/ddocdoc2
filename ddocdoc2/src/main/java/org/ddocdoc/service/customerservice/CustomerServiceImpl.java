package org.ddocdoc.service.customerservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.mapper.customermapper.CustomerMapper;
import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.symptomdetailvo.SymptomDetailVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;
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
		System.out.println("���񽺿��� : " + hos_name);
		
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
		((CustomerVO)CustomerController.session.getAttribute("customer")).setCus_pw(customer.getCus_pw());
		((CustomerVO)CustomerController.session.getAttribute("customer")).setCus_name(customer.getCus_name());
		((CustomerVO)CustomerController.session.getAttribute("customer")).setCus_addr(customer.getCus_addr());
		((CustomerVO)CustomerController.session.getAttribute("customer")).setCus_email(customer.getCus_email());
		return mapper.customerUpdate(customer);
	}

	@Override
	public int customerDelete(String cus_num) {
		return mapper.customerDelete(cus_num);
	}

	@Override
	public CustomerVO customerDetail(String cus_num) {
		return mapper.customerDetail(cus_num);
	}

	@Override
	public PresVO presRealDetail(String hos_res_num) {
		return mapper.presRealDetail(hos_res_num);
	}

	@Override
	public List<PresDetailVO> cusPresDetailList(String pres_num) {
		return mapper.cusPresDetailList(pres_num);
	}

	@Override
	public List<String> cusPresDetailMedName(String pres_num) {
		return mapper.cusPresDetailMedName(pres_num);
	}

	@Override
	public int insertPay(PayVO pay) {
		return mapper.insertPay(pay);
	}

	@Override
	public int updatePay(String pres_num) {
		return mapper.updatePay(pres_num);
	}

	@Override
	public String selectPayCheck(String pres_num) {
		return mapper.selectPayCheck(pres_num);
	}

	@Override
	public int selectPayPrice(String hos_res_num) {
		return mapper.selectPayPrice(hos_res_num);
	}

	@Override
	public HospitalVO detailHospital(String hos_num) {
		return mapper.detailHospital(hos_num);
	}

	@Override
	public int symptomInsert(SymptomVO sym) {
		return mapper.symptomInsert(sym);
	}

	@Override
	public SymptomDetailVO symptomDetail(String cus_num) {
		return mapper.symptomDetail(cus_num);
	}

	@Override
	public int insertPharRes(PharResVO pvo) {
		return mapper.insertPharRes(pvo);
	}

	@Override
	public PharResVO pharResDetail(String phar_res_num) {
		return mapper.pharResDetail(phar_res_num);
	}

	@Override
	public String selectPharmacyName(String phar_num) {
		return mapper.selectPharmacyName(phar_num);
	}

	@Override
	public int increasePharResWait(String phar_res_num) {
		return mapper.increasePharResWait(phar_res_num);
	}

	@Override
	public int detailPharWait(String phar_num) {
		return mapper.detailPharWait(phar_num);
	}

	@Override
	public String selectPharNum(String phar_name) {
		return mapper.selectPharNum(phar_name);
	}

	@Override
	public int notifyInsert(HashMap<String, String> map) {
		return mapper.notifyInsert(map);
	}

	@Override
	public String hospitalOneName(String hos_num) {
		return mapper.hospitalOneName(hos_num);
	}
	
	@Override
	public int deleteRes(String hos_res_num) {
		return mapper.deleteRes(hos_res_num);
	}
	
	
	
	
	
	
	
	
}
