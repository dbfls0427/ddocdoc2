package org.ddocdoc.service.checkupservice;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;
import org.ddocdoc.vo.injectvo.ChildInjectVO;
import org.ddocdoc.vo.injectvo.InjectInfoVO;


public interface CheckupService {
	

	// 검진추천내역 불러오기
	public List<CheckupInfoVO> selectCheInfo();

	// 검진한 내역 불러오기
	public List<String> selectCheList(String ch_num);
	
	// 검진 기록하기
	public int insertChe(ChildCheckupVO ccvo);
	
	// 검진내역 상세보기
	public ChildCheckupVO selectCheDetail(HashMap<String, String> map);
	
	// 검진내역 수정
	public int updateChe(ChildCheckupVO ccvo);
	
	// 검진내역 삭제 
	public int deleteChe(HashMap<String, String> map);
	
	// 검진률 가져오기
	public int cheCount(String ch_num);
	
	// 전체감진개수
	public int cheTotal(String ch_num);
}
