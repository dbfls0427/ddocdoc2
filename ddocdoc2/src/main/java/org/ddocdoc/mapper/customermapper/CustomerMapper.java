package org.ddocdoc.mapper.customermapper;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.loginvo.LoginVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.symptomdetailvo.SymptomDetailVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;

public interface CustomerMapper {
	int insertCustomer(CustomerVO customer);
	
	CustomerVO loginCustomer(String cus_id);
	
	void insertCustomerAuth(CustomerAuthVO cusAuth);
	
	String cusNumSelect(String cus_id);
	
	// ���� ��ȣ ���
	String selectHosNum(String hos_name);
	
	// ���� ���� �Է�
	int insertHospitalRes(HospitalResVO hospitalresVO);
	
	// ���� ��� ����Ʈ
	List<HospitalResVO> resList(String cus_num);
	
    // ���� ���� ����
	HospitalVO detailHospital(String hos_num);
	
	// ���� �̸� ����
	List<String> detailNameHospital(String cus_num);
	
	//���� �� ����
	HospitalResVO detailRes(String hos_res_num);
	
	// Cancel Hospital Reservation
    int deleteRes(String hos_res_num);
	
	// ���� ����� �� ����ȣ ����
//	int decreaseWait(String hos_num);
	
	// ����ȣ ��ȸ
	int detailWait(String hos_res_num);
	
	// ���������� ����
	int customerUpdate(CustomerVO customer);
	
	// ȸ�� Ż��
	int customerDelete(String cus_num);
	
	// ó���� ����
	PresVO presRealDetail(String hos_res_num);
	
	// ó���� �� �� ��ȸ ����Ʈ
	List<PresDetailVO> cusPresDetailList(String pres_num);
	
	// ó���� �� �� �� �̸�
	List<String> cusPresDetailMedName(String pres_num);
	
	// ���� �ϱ�
	int insertPay(PayVO pay);
	
	// �����Ϸ�
	int updatePay(String pres_num);
	
	// ó���� ���� ���� ����
	String selectPayCheck(String pres_num);
	
	// �� ���� ����
	int selectPayPrice(String hos_res_num);
	
	//�౹ ��ȣ ���
	String selectPharNum(String phar_name);
	
	//�౹ �����ϱ�
	int insertPharRes(PharResVO pvo);
	
	//�౹ ���� ����Ʈ
	List<PharResVO> pharResList(String cus_num);
	
	//�౹ �̸� ��������
	List<String> detailNamePharmacy(String cus_num);
	
	// �౹ ���� �󼼺���
	PharResVO pharResDetail(String phar_res_num);
	
	// �౹ �̸� ����
	String selectPharmacyName(String phar_num);
	
	// �౹ ����ȣ ����
	int increasePharResWait(String phar_res_num);
	
	// �౹ ����ȣ ��ȸ
	int detailPharWait(String phar_num);
	
	/*
	//review create
	int reviewInsert(ReviewVO ReviewVO);
		
	//review detail
	ReviewVO reviewDetail(String rv_num);
		
	//review info list
	List<ReviewVO> reviewList(String cus_num);
		
	//review update
	int reviewUpdate(ReviewVO ReviewVO);
		
	//review delete
	int reviewDelete(String rv_num);
	
	// ��ȸ �� ����
	int increaseHits(String rv_num);
	
	// �Խñ� ��ȸ �� ��ȸ
	int detailHits(String rv_num);
	*/
	// ���� ���� Ȯ��
	String checkResAcpt(String hos_res_num);
	
	// ȸ�� ������
	CustomerVO customerDetail(String cus_num);
	
	// ���� �Է�
	int symptomInsert(SymptomVO sym);
	
	// ���� �˻� ���
	SymptomDetailVO symptomDetail(String cus_num);
	
	// �˸����
	int notifyInsert(HashMap<String, String> map);
	
	// �����̸� �Ѱ� ����
	String hospitalOneName(String hos_num);
	
	
	
}
