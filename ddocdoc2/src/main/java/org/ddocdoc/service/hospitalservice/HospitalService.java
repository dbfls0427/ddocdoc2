package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.notifyvo.NotifyVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;

public interface HospitalService {

	// insert
	public int hospitalInsert(HospitalVO hospital);

	// list
	public List<HospitalVO> hospitalList();

	// detail
	public HospitalVO hospitalDetail(String hos_num);

	// update
	public int hospitalUpdate(HospitalVO hospitalVO);

	// delete
	public int hospitalDelete(String hos_num);

	// 병원 예약 환자 리스트
	public List<HospitalResVO> hosResList(String hos_num);

	// 병원 예약 접수
	public int booleanHosRes(String hos_res_num);

	// 대기번호 증가
	public int increaseWait(String hos_num);

	// 해당 병원 대기번호 발급
	public int hospitalWait(String hos_num);

	// 대기번호 데이터 저장
	public int insertWaitData(HospitalWaitVO waitVO);

	// 약 리스트
	public List<MedicineVO> medicineList();

	// 처방전 명세 입력
	public int insertPreDetail(PresDetailVO presDetail);

	// 처방전 약 명세 리스트
	public List<PresDetailVO> presDetailList(String pres_num);

	// 처방전 약 명세 약 이름
	public List<String> presDetailMedName(String pres_num);

	// 처방전 입력
	public int insertPres(PresVO presVO);

	// presDetail
	public PresVO presDetail();
	
	// 알림 리스트
	public List<String> notifyList();
		
	// 알림 갯수
	public int notifyCount();
	
	// 알림 넘버
	public List<String> notifyNumList();
		
	// 알림 클릭시
	public void notifyUpdate(String not_num);
}