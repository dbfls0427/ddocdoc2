package org.ddocdoc.service.heightservice;

import java.util.List;

import org.ddocdoc.mapper.heightmapper.HeightMapper;
import org.ddocdoc.vo.heightvo.HeightVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class HeightServiceImpl implements HeightService {

	@Setter(onMethod_ = @Autowired)
	private HeightMapper mapper;

	@Override
	public List<HeightVO> heightList(String ch_num) {
		return mapper.heightList(ch_num);
	}

	@Override
	public int heightInsert(HeightVO chvo) {
		return mapper.heightInsert(chvo);
	}

	@Override
	public HeightVO heightDetail(String he_num) {
		return mapper.heightDetail(he_num);
	}

	@Override
	public int heightDelete(String he_num) {
		return mapper.heightDelete(he_num);
	}

	@Override
	public int updateChildHeight(HeightVO chvo) {
		return mapper.updateChildHeight(chvo);
	}
	 
}
