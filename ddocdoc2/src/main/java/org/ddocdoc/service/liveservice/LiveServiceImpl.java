package org.ddocdoc.service.liveservice;

import java.util.List;

import org.ddocdoc.mapper.livemapper.LiveMapper;
import org.ddocdoc.vo.livevo.LiveVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LiveServiceImpl implements LiveService {

	private LiveMapper mapper;
	
	@Override
	public List<String> selectHos() {
		List<String> list = mapper.selectHos();
		return list;
	}

	@Override
	public int insertLive(LiveVO live) {
		return mapper.insertLive(live);
	}

	@Override
	public List<LiveVO> liveList() {
		return mapper.liveList();
	}

	@Override
	public int liveUpdate(LiveVO live) {
		return mapper.liveUpdate(live);
	}

	@Override
	public List<LiveVO> pastLive(String cus_num) {
		return mapper.pastLive(cus_num);
	}

	@Override
	public int liveStop(String live_address) {
		return mapper.liveStop(live_address);
	}

	@Override
	public int cusStop(String live_address) {
		return mapper.cusStop(live_address);
	}

}
