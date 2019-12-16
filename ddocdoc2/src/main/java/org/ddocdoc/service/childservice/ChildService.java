package org.ddocdoc.service.childservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.childvo.ChildVO;

public interface ChildService {

	// 아이정보 등록 서비스
	public int insertChild(HttpServletRequest request) throws Exception;
	
	// 아이정보 상세보기 서비스
	public ChildVO childDetail(String ch_num);
	
	// 아이정보 리스트 서비스
	public List<ChildVO> childList(String cus_num);
	
	// 아이정보 수정 서비스
	public int updateChild(ChildVO childVO) throws Exception;
	
	// 아이정보 삭제 서비스
	public int deleteChild(String ch_num);
}
