package org.ddocdoc.service.pharmacyservice;

import java.util.List;

import org.ddocdoc.vo.pharmacyvo.PharmacyVO;

public interface PharmacyService {

	//insert
	public int pharmacyInsert(PharmacyVO pharmacyVO);


	// list
	public List<PharmacyVO> pharmacyList();
	
	// detail
	public PharmacyVO pharmacyDetail(String phar_num);
	
	// update
	public int pharmacyUpdate(PharmacyVO pharmacyVO);
	
	// delete
	public int pharmacyDelete(String phar_num);


}
