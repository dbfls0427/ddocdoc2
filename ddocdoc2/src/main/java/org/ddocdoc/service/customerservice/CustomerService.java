package org.ddocdoc.service.customerservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.symptomdetailvo.SymptomDetailVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;

public interface CustomerService {

	public void insertCustomer(CustomerVO customer);

	// �α��� ���ǳֱ�
	public CustomerVO loginCustomer(String cus_id);

	// ���� ��ȣ ��������
	public String selectHosNum(String hos_name);

	// ���� ����
	public void insertHospitalRes(HospitalResVO hospitalresVO);

	// ���� ����Ʈ
	public List<HospitalResVO> resList(String cus_num);

	// ���� �̸� ����
	public List<String> detailNameHospital(String cus_num);

	// �౹ ���� ����Ʈ
	public List<PharResVO> pharResList(String cus_num);

	// �౹ �̸� ��������
	public List<String> detailNamePharmacy(String cus_num);

	// ���� �� ����
	public HospitalResVO detailRes(String hos_res_num);

	// ���� ���� Ȯ��
	public String checkResAcpt(String hos_res_num);

	// ����ȣ ��ȸ
	public int detailWait(String hos_res_num);

	// ���������� ����
	public int customerUpdate(CustomerVO customer);

	// ȸ�� Ż��
	public int customerDelete(String cus_num);

	// ȸ�� ��
	public CustomerVO customerDetail(String cus_num);

	// ó���� ����
	public PresVO presRealDetail(String hos_res_num);

	// ó���� �� �� ��ȸ ����Ʈ
	public List<PresDetailVO> cusPresDetailList(String pres_num);

	// ó���� �� �� �� �̸�
	public List<String> cusPresDetailMedName(String pres_num);

	// ���� �ϱ�
	public int insertPay(PayVO pay);

	// �����Ϸ�
	public int updatePay(String pres_num);

	// ó���� ���� ���� ����
	public String selectPayCheck(String pres_num);

	// �� ���� ����
	public int selectPayPrice(String hos_res_num);

	// ���� ���� ����
	public HospitalVO detailHospital(String hos_num);
	
	// ���� �Է�
	public int symptomInsert(SymptomVO sym);
	
	// ���� �˻� ���
	public SymptomDetailVO symptomDetail(String cus_num);
	
	//�౹ ��ȣ ���
	public String selectPharNum(String phar_name);
	
	//�౹ �����ϱ�
	int insertPharRes(PharResVO pvo);
		
	// �౹ ���� �󼼺���
	public PharResVO pharResDetail(String phar_res_num);
	
	// �౹ �̸� ����
	public String selectPharmacyName(String phar_num);
	
	// �౹ ����ȣ ����
	public int increasePharResWait(String phar_res_num);
	
	// �౹ ����ȣ ��ȸ
	public int detailPharWait(String phar_num);
	
	// �˸����
	public int notifyInsert(HashMap<String, String> map);
	
	// �����̸� �Ѱ� ����
	public String hospitalOneName(String hos_num);
	
	// Cancel Hospital Reservation
    public int deleteRes(String hos_res_num);
	
	
}
