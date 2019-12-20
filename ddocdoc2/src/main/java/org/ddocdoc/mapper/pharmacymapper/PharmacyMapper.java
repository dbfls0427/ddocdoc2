package org.ddocdoc.mapper.pharmacymapper;

import java.util.List;

import org.ddocdoc.vo.pharmacyvo.PharmacyVO;

public interface PharmacyMapper {

	// insert
	int pharmacyInsert(PharmacyVO pharmacyVO);
	
	// list
	List<PharmacyVO> pharmacyList();
	
	// detail
	PharmacyVO pharmacyDetail(String phar_num);
	
	// update
	int pharmacyUpdate(PharmacyVO pharmacyVO);
	
	// delete
	int pharmacyDelete(String phar_num);
}
