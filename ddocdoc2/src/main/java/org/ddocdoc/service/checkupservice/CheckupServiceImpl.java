package org.ddocdoc.service.checkupservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.mapper.checkupmapper.CheckupMapper;
import org.ddocdoc.mapper.injectmapper.InjectMapper;
import org.ddocdoc.service.injectservice.InjectServiceImpl;
import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CheckupServiceImpl implements CheckupService {
	
	private CheckupMapper mapper;

	@Override
	public List<CheckupInfoVO> selectCheInfo() {
		return mapper.selectCheInfo();
	}

	@Override
	public List<String> selectCheList(String ch_num) {
		return mapper.selectCheList(ch_num);
	}

	@Override
	public int insertChe(ChildCheckupVO ccvo) {
		return mapper.insertChe(ccvo);
	}

	@Override
	public ChildCheckupVO selectCheDetail(HashMap<String, String> map) {
		return mapper.selectCheDetail(map);
	}

	@Override
	public int updateChe(ChildCheckupVO ccvo) {
		return mapper.updateChe(ccvo);
	}

	@Override
	public int deleteChe(HashMap<String, String> map) {
		return mapper.deleteChe(map);
	}

	@Override
	public int cheCount(String ch_num) {
		return mapper.cheCount(ch_num);
	}

	@Override
	public int cheTotal(String ch_num) {
		return mapper.cheTotal(ch_num);
	}

}
