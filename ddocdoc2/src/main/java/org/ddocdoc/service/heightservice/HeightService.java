package org.ddocdoc.service.heightservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.heightvo.HeightVO;

public interface HeightService {

	//아이키 전체리스트
	List<HeightVO> heightList(String ch_num);
	
	//아이키 등록
	int heightInsert(HeightVO chvo);
	
	//아이키 상세
	HeightVO heightDetail(String he_num);
	
	//아이키 삭제
	int heightDelete(String he_num);
	
	//update
	int updateChildHeight(HeightVO chvo);
	
	//표준키 가져오기
	Float selectStHeight(HashMap<String, String> map);
}
