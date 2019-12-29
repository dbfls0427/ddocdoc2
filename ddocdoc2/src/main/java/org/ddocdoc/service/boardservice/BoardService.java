package org.ddocdoc.service.boardservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.ddocdoc.vo.notifyvo.NotifyVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;

public interface BoardService {

	// notice insert
	public int noticeInsert(NoticeVO noticeVO);

	// notice list
	public List<NoticeVO> noticeList();

	// notice detail
	public NoticeVO noticeDetail(String not_num);

	// notice update
	public int noticeUpdate(NoticeVO noticeVO);

	// notice delete
	public int noticeDelete(String not_num);
	
	// AnQ insert
	public int askInsert(AskVO askVO);

	// AnQ list
	public List<AskVO> askList();

	// AnQ detail
	public AskVO askDetail(String ask_num);

	// AnQ update
	public int askUpdate(AskVO askVO);

	// AnQ delete
	public int askDelete(String ask_num);

}