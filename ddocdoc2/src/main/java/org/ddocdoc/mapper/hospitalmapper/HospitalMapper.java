package org.ddocdoc.mapper.hospitalmapper;

import java.util.List;

import org.ddocdoc.vo.hospitalvo.HospitalVO;

public interface HospitalMapper {

	// insert
	int hospitalInsert(HospitalVO hospitalVO);
	
	// list
	List<HospitalVO> hospitalList(String hos_num);
	
	// detail
	HospitalVO hospitalDetail(String hos_num);
	
	// update
	int hospitalUpdate(HospitalVO hospitalVO);
	
	// delete
	int hospitalDelete(String hos_num);
}
