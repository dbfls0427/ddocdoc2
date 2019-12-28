package org.ddocdoc.mapper.hospitalmapper;

import java.util.List;

import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.notifyvo.NotifyVO;
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

	// ���� ���� ���� ����Ʈ
	List<HospitalResVO> hosResList(String hos_num);

	// ���� ���� ����
	int booleanHosRes(String hos_res_num);

	// ����ȣ ����
	int increaseWait(String hos_num);

	// �ش� ���� ����ȣ �߱�
	int hospitalWait(String hos_num);

	// ����ȣ ������ ����
	int insertWaitData(HospitalWaitVO waitVO);

	//
	
	// �� ����Ʈ
	List<MedicineVO> medicineList();

	// ó���� �� �Է�
	int insertPreDetail(PresDetailVO presDetail);

	// ó���� �� �� ����Ʈ
	List<PresDetailVO> presDetailList(String pres_num);

	// ó���� �� �� �� �̸�
	List<String> presDetailMedName(String pres_num);

	// ó���� �Է�
	int insertPres(PresVO presVO);

	// presDetail
	PresVO presDetail();
	
	// �˸� ����Ʈ
	List<String> notifyList();
	
	// �˸� ����
	int notifyCount();
	
	// �˸� �ѹ�
	List<String> notifyNumList();
	
	// �˸� Ŭ����
	void notifyUpdate(String not_num);
	
	// �˶��� ���� �̸� �߰��ϱ�
	List<String> notifyHosNameList();
	
	// ä�ÿ� �Ѱ��� hos_num
	String chatHosNum(String not_num);
	
	// img upload: insert
	public void imgInsert(HospitalAttachVO hospitalAttachVO);
	
	CustomerVO customerDetail(String cus_num);
	
}
