package org.ddocdoc.mapper.hospitalmapper;

import java.util.List;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;

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
}
