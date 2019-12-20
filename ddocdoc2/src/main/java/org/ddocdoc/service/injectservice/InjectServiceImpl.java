package org.ddocdoc.service.injectservice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.mapper.childmapper.ChildMapper;
import org.ddocdoc.mapper.injectmapper.InjectMapper;
import org.ddocdoc.service.childservice.ChildServiceImpl;
import org.ddocdoc.vo.injectvo.ChildInjectVO;
import org.ddocdoc.vo.injectvo.InjectInfoVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InjectServiceImpl implements InjectService {

	private InjectMapper mapper;
	
	@Override
	public List<InjectInfoVO> selectInjInfo() {
		return mapper.selectInjInfo();
	}

	@Override
	public List<String> selectInjList(String ch_num) {
		return mapper.selectInjList(ch_num);
	}

	@Override
	public int insertInj(ChildInjectVO civo) {
		return mapper.insertInj(civo);
	}

	@Override
	public ChildInjectVO selectInjDetail(HashMap<String, String> map) {
		return mapper.selectInjDetail(map);
	}

	@Override
	public int updateInj(ChildInjectVO civo) {
		return mapper.updateInj(civo);
	}

	@Override
	public int deleteInj(HashMap<String, String> map) {
		return mapper.deleteInj(map);
	}

	@Override
	public int injCount(String ch_num) {
		return mapper.injCount(ch_num);
	}

	@Override
	public int injTotal(String ch_num) {
		return mapper.injTotal(ch_num);
	}



}
