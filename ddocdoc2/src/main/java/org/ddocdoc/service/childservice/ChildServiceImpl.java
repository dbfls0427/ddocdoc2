package org.ddocdoc.service.childservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.mapper.childmapper.ChildMapper;
import org.ddocdoc.vo.childvo.ChildVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChildServiceImpl implements ChildService {

	@Setter(onMethod_ = @Autowired)
	private ChildMapper mapper;
	
	@Override
	public int insertChild(ChildVO childVO) throws Exception {
		return mapper.insertChild(childVO);
	}

	@Override
	public ChildVO childDetail(String ch_num) {
		return mapper.childDetail(ch_num);
	}

	@Override
	public List<ChildVO> childList(String cus_num) {
		log.info("service_childList cus_num: " + cus_num);
		
		return mapper.childList(cus_num);
	}

	@Override
	public int updateChild(ChildVO childVO) throws Exception {
		return mapper.updateChild(childVO);
	}

	@Override
	public int deleteChild(String ch_num) {
		return mapper.deleteChild(ch_num);
	}

}
