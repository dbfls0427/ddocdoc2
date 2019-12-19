package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;

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
   
   
}