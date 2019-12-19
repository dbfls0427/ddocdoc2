package org.ddocdoc.mapper.hospitalmapper;

import java.util.List;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;

public interface HospitalMapper {

	// insert
	int hospitalInsert(HospitalVO hospitalVO);

	// list
	List<HospitalVO> hospitalList();

	// detail
	HospitalVO hospitalDetail(String hos_num);

	// update
	int hospitalUpdate(HospitalVO hospitalVO);

	// delete
	int hospitalDelete(String hos_num);

	// 병원 예약 정보 리스트
	List<HospitalResVO> hosResList(String hos_num);

	// 병원 예약 접수
	int booleanHosRes(String hos_res_num);

	// 대기번호 증가
	int increaseWait(String hos_num);

	// 해당 병원 대기번호 발급
	int hospitalWait(String hos_num);

	// 대기번호 데이터 저장
	int insertWaitData(HospitalWaitVO waitVO);

	//
	
	// 약 리스트
	List<MedicineVO> medicineList();

	// 처방전 명세 입력
	int insertPreDetail(PresDetailVO presDetail);

	// 처방전 약 명세 리스트
	List<PresDetailVO> presDetailList(String pres_num);

	// 처방전 약 명세 약 이름
	List<String> presDetailMedName(String pres_num);

	// 처방전 입력
	int insertPres(PresVO presVO);

	// presDetail
	PresVO presDetail();
}
