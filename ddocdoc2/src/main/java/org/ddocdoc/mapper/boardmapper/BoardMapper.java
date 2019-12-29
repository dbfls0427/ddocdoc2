package org.ddocdoc.mapper.boardmapper;

import java.util.List;

import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.ddocdoc.vo.termvo.Criteria;
import org.ddocdoc.vo.termvo.TermVO;

public interface BoardMapper {

	// notice insert
	int noticeInsert(NoticeVO noticeVO);

	// notice list
	List<NoticeVO> noticeList();

	// notice detail
	NoticeVO noticeDetail(String not_num);

	// notice update
	int noticeUpdate(NoticeVO noticeVO);

	// notice delete
	int noticeDelete(String not_num);
	
	// AnQ insert
	int askInsert(AskVO askVO);

	// AnQ list
	List<AskVO> askList();

	// AnQ detail
	AskVO askDetail(String ask_num);

	// AnQ update
	int askUpdate(AskVO askVO);

	// AnQ delete
	int askDelete(String ask_num);
	
	// term insert
	int termInsert(TermVO termVO);

	// term list
	List<TermVO> termList();

	// term detail
	TermVO termDetail(String term_num);

	// term  update
	int termUpdate(TermVO termVO);

	// term  delete
	int termDelete(String term_num);

	// term pagination
	List<TermVO> getListWithPaging(Criteria cri);
	
	// term page
	int getTotalCount(Criteria cri);
	
}
