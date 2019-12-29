package org.ddocdoc.mapper.livemapper;

import java.util.List;

import org.ddocdoc.vo.livevo.LiveVO;

public interface LiveMapper {
	
	//병원이름불러오기
	public List<String> selectHos();
	
	//라이브방송등록
	public int insertLive(LiveVO live);
	
	//현재방송목록 불러오기
	public List<LiveVO> liveList();
	
	//방송정보수정
	public int liveUpdate(LiveVO live);
	
	//고객의 지난방송 불러오기
	public List<LiveVO> pastLive(String cus_num);
	
	//방송종료
	public int liveStop(String live_address);
	
	//고객이 상담종료시
	public int cusStop(LiveVO live);
	
	//상담내용
	public LiveVO liveContent(String live_num);

}
