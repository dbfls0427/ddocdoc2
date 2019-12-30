package org.ddocdoc.service.replyservice;

import java.util.List;

import org.ddocdoc.mapper.replymapper.ReplyMapper;
import org.ddocdoc.vo.replyvo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Data
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	
	@Override
	public int replyInsert(ReplyVO rep) {
		return mapper.replyInsert(rep);
	}

	@Override
	public ReplyVO replyDetail(int rep_num) {
		return mapper.replyDetail(rep_num);
	}

	@Override
	public int replyDelete(int rep_num) {
		return mapper.replyDelete(rep_num);
	}

	@Override
	public int replyUpdate(ReplyVO rep) {
		return mapper.replyUpdate(rep);
	}

	@Override
	public List<ReplyVO> replyList(String com_num) {
		return mapper.replyList(com_num);
	}
	
}
