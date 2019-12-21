package org.ddocdoc.mapper.checkupmapper;

import java.util.HashMap;

import java.util.List;

import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;


public interface CheckupMapper {

	// 검진추천내역 불러오기
	List<CheckupInfoVO> selectCheInfo();

	// 검진한 내역 불러오기
	List<String> selectCheList(String ch_num);
	
	// 검진 기록하기
	int insertChe(ChildCheckupVO ccvo);
	
	// 검진내역 상세보기
	ChildCheckupVO selectCheDetail(HashMap<String, String> map);
	
	// 검진내역 수정
	int updateChe(ChildCheckupVO ccvo);
	
	// 검진내역 삭제 
	int deleteChe(HashMap<String, String> map);
	
	// 검진률 가져오기
	int cheCount(String ch_num);
	
	// 전체감진개수
	int cheTotal(String ch_num);
}
