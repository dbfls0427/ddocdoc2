package org.ddocdoc.mapper.childmapper;

import java.util.List;


import org.ddocdoc.vo.childvo.ChildVO;

public interface ChildMapper {


	String getTime();
	// 아이 정보 리스트
	List<ChildVO> childList(String cus_num);

}
