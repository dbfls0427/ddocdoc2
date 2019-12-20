package org.ddocdoc.service.injectservice;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.injectvo.ChildInjectVO;
import org.ddocdoc.vo.injectvo.InjectInfoVO;


public interface InjectService {

	
	List<InjectInfoVO> selectInjInfo();
	
	
	List<String> selectInjList(String ch_num);
	
	
	int insertInj(ChildInjectVO civo);
	
	
	ChildInjectVO selectInjDetail(HashMap<String, String> map);
	
	
	int updateInj(ChildInjectVO civo);
	
	
	int deleteInj(HashMap<String, String> map);
	
	
	int injCount(String ch_num);
	
	
	int injTotal(String ch_num);
}
