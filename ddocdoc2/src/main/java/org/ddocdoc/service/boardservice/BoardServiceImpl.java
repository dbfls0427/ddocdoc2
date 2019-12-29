package org.ddocdoc.service.boardservice;

import java.util.List;

import org.ddocdoc.mapper.boardmapper.BoardMapper;
import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;

	@Override
	public int noticeInsert(NoticeVO noticeVO) {
		return mapper.noticeInsert(noticeVO);
	}

	@Override
	public List<NoticeVO> noticeList() {
		return mapper.noticeList();
	}

	@Override
	public NoticeVO noticeDetail(String not_num) {
		return mapper.noticeDetail(not_num);
	}

	@Override
	public int noticeUpdate(NoticeVO noticeVO) {
		return mapper.noticeUpdate(noticeVO);
	}

	@Override
	public int noticeDelete(String not_num) {
		return mapper.noticeDelete(not_num);
	}

	@Override
	public int askInsert(AskVO askVO) {
		return mapper.askInsert(askVO);
	}

	@Override
	public List<AskVO> askList() {
		return mapper.askList();
	}

	@Override
	public AskVO askDetail(String ask_num) {
		return mapper.askDetail(ask_num);
	}

	@Override
	public int askUpdate(AskVO askVO) {
		return mapper.askUpdate(askVO);
	}

	@Override
	public int askDelete(String ask_num) {
		return mapper.askDelete(ask_num);
	}

	
	
}