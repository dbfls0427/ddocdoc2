package org.ddocdoc.service.replyservice;

import java.util.List;

import org.ddocdoc.vo.replyvo.ReplyVO;


public interface ReplyService {
	public int replyInsert(ReplyVO rep);
	
	public ReplyVO replyDetail(int rep_num);
	
	public int replyDelete(int rep_num);
	
	public int replyUpdate(ReplyVO rep);
	
	public List<ReplyVO> replyList(String com_num);
}
