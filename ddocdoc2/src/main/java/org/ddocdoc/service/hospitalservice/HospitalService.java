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
   
   // ���� ���� ȯ�� ����Ʈ
   public List<HospitalResVO> hosResList(String hos_num);
   
   // ���� ���� ����
   public int booleanHosRes(String hos_res_num);
   
   // ����ȣ ����
   public int increaseWait(String hos_num);
   
   // �ش� ���� ����ȣ �߱�
	public int hospitalWait(String hos_num);
	
	// ����ȣ ������ ����
	public int insertWaitData(HospitalWaitVO waitVO);
   
   
}