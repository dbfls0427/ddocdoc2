package org.ddocdoc.service.pharmacyservice;

import java.util.List;

import org.ddocdoc.mapper.pharmacymapper.PharmacyMapper;
import org.ddocdoc.service.hospitalservice.HospitalServiceImpl;
import org.ddocdoc.vo.pharmacyvo.PharmacyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PharmacyServiceImpl implements PharmacyService {
	
	@Setter(onMethod_=@Autowired)
	private PharmacyMapper mapper;
	
	// insert
	@Override
	public int pharmacyInsert(PharmacyVO pharmacyVO) {
		return mapper.pharmacyInsert(pharmacyVO);
	}

	// list
	@Override
	public List<PharmacyVO> pharmacyList() {
		return mapper.pharmacyList();
	}

	// detail
	@Override
	public PharmacyVO pharmacyDetail(String phar_num) {
		return mapper.pharmacyDetail(phar_num);
	}

	// update
	@Override
	public int pharmacyUpdate(PharmacyVO pharmacyVO) {
		return mapper.pharmacyUpdate(pharmacyVO);
	}

	// delete
	@Override
	public int pharmacyDelete(String phar_num) {
		return mapper.pharmacyDelete(phar_num);
	}
	
	
	
}
