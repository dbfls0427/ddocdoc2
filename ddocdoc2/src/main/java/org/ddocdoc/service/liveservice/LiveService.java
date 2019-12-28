package org.ddocdoc.service.liveservice;

import java.util.List;

import org.ddocdoc.vo.livevo.LiveVO;

public interface LiveService {
	
	public List<String> selectHos();
	
	public int insertLive(LiveVO live);
	
	public List<LiveVO> liveList();
	
	public int liveUpdate(LiveVO live);
	
	public List<LiveVO> pastLive(String cus_num);
	
	public int liveStop(String live_address);
	
	public int cusStop(String live_address);

}
