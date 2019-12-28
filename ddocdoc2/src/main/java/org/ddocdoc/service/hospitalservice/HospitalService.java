package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;
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

	// �� ����Ʈ
	public List<MedicineVO> medicineList();

	// ó���� �� �Է�
	public int insertPreDetail(PresDetailVO presDetail);

	// ó���� �� �� ����Ʈ
	public List<PresDetailVO> presDetailList(String pres_num);

	// ó���� �� �� �� �̸�
	public List<String> presDetailMedName(String pres_num);

	// ó���� �Է�
	public int insertPres(PresVO presVO);

	// presDetail
	public PresVO presDetail();
	
	// �˸� ����Ʈ
	public List<String> notifyList();
		
	// �˸� ����
	public int notifyCount();
	
	// �˸� �ѹ�
	public List<String> notifyNumList();
		
	// �˸� Ŭ����
	public void notifyUpdate(String not_num);
	
	// �˶��� ���� �̸� �߰��ϱ�
	public List<String> notifyHosNameList();
	
	// ä�ÿ� �Ѱ��� hos_num
	public String chatHosNum(String not_num);
	
	// img upload: insert
	public void imgInsert(HospitalAttachVO hospitalAttachVO);
	
}