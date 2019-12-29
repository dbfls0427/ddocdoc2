package org.ddocdoc.mapper.replymapper;

import java.util.List;

import org.ddocdoc.vo.replyvo.ReplyVO;

public interface ReplyMapper {
	
	int replyInsert(ReplyVO rep);
	
	ReplyVO replyDetail(int rep_num);
	
	int replyDelete(int rep_num);
	
	int replyUpdate(int rep_num);
	
	List<ReplyVO> replyList(String com_num);

}
