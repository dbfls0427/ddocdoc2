package org.ddocdoc.service.customerservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.communityvo.CommunityVO;
import org.ddocdoc.vo.communityvo.Criteria;
import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.symptomdetailvo.SymptomDetailVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;

public interface CustomerService {

	public void insertCustomer(CustomerVO customer);

	// �뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�떎�꽔源띿삕
	public CustomerVO loginCustomer(String cus_id);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�샇 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	public String selectHosNum(String hos_name);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public void insertHospitalRes(HospitalResVO hospitalresVO);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�듃
	public List<HospitalResVO> resList(String cus_num);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕
	public List<String> detailNameHospital(String cus_num);

	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�듃
	public List<PharResVO> pharResList(String cus_num);

	// �뜝�뛿援� �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	public List<String> detailNamePharmacy(String cus_num);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public HospitalResVO detailRes(String hos_res_num);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
	public String checkResAcpt(String hos_res_num);

	// �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�쉶
	public int detailWait(String hos_res_num);

	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public int customerUpdate(CustomerVO customer);

	// �쉶�뜝�룞�삕 �깉�뜝�룞�삕
	public int customerDelete(String cus_num);

	// �쉶�뜝�룞�삕 �뜝�룞�삕
	public CustomerVO customerDetail(String cus_num);

	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public PresVO presRealDetail(String hos_res_num);

	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�쉶 �뜝�룞�삕�뜝�룞�삕�듃
	public List<PresDetailVO> cusPresDetailList(String pres_num);

	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�떛紐뚯삕
	public List<String> cusPresDetailMedName(String pres_num);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�떦源띿삕
	public int insertPay(PayVO pay);

	// �뜝�룞�삕�뜝�룞�삕�뜝�떦琉꾩삕
	public int updatePay(String pres_num);

	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public String selectPayCheck(String pres_num);

	// �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public int selectPayPrice(String hos_res_num);

	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public HospitalVO detailHospital(String hos_num);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�뙃琉꾩삕
	public int symptomInsert(SymptomVO sym);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�떙�궪�삕 �뜝�룞�삕�뜝占�
	public SymptomDetailVO symptomDetail(String cus_num);
	
	//�뜝�뛿援� �뜝�룞�삕�샇 �뜝�룞�삕�뜝占�
	public String selectPharNum(String phar_name);
	
	//�뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕
	int insertPharRes(PharResVO pvo);
		
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕 �뜝�룫�꽭釉앹삕�뜝�룞�삕
	public PharResVO pharResDetail(String phar_res_num);
	
	// �뜝�뛿援� �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕
	public String selectPharmacyName(String phar_num);
	
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�뜝�룞�삕
	public int increasePharResWait(String phar_res_num);
	
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�쉶
	public int detailPharWait(String phar_num);
	
	// �뜝�떙紐뚯삕�뜝�룞�삕�뜝占�
	public int notifyInsert(HashMap<String, String> map);
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�떛紐뚯삕 �뜝�떬怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕
	public String hospitalOneName(String hos_num);
	
	// Cancel Hospital Reservation
    public int deleteRes(String hos_res_num);
	
    // community insert
    int comInsert(CommunityVO com);
    
    // community list
 	List<CommunityVO> comList();
 	
 	// community detail
 	CommunityVO comDetail(String com_num);
 	
	// community delete
	int comDelete(String com_num);
	
	// community update
	int comUpdate(CommunityVO com);
	
	// notice list
	public List<NoticeVO> noticeList();

	// notice detail
	public NoticeVO noticeDetail(String not_num);
	
	public List<CommunityVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	
}
