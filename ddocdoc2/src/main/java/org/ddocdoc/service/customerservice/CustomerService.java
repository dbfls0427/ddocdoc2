package org.ddocdoc.service.customerservice;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.communityvo.CommunityVO;
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

	// 占싸깍옙占쏙옙 占쏙옙占실넣깍옙
	public CustomerVO loginCustomer(String cus_id);

	// 占쏙옙占쏙옙 占쏙옙호 占쏙옙占쏙옙占쏙옙占쏙옙
	public String selectHosNum(String hos_name);

	// 占쏙옙占쏙옙 占쏙옙占쏙옙
	public void insertHospitalRes(HospitalResVO hospitalresVO);

	// 占쏙옙占쏙옙 占쏙옙占쏙옙트
	public List<HospitalResVO> resList(String cus_num);

	// 占쏙옙占쏙옙 占싱몌옙 占쏙옙占쏙옙
	public List<String> detailNameHospital(String cus_num);

	// 占썅국 占쏙옙占쏙옙 占쏙옙占쏙옙트
	public List<PharResVO> pharResList(String cus_num);

	// 占썅국 占싱몌옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public List<String> detailNamePharmacy(String cus_num);

	// 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	public HospitalResVO detailRes(String hos_res_num);

	// 占쏙옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
	public String checkResAcpt(String hos_res_num);

	// 占쏙옙占쏙옙호 占쏙옙회
	public int detailWait(String hos_res_num);

	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	public int customerUpdate(CustomerVO customer);

	// 회占쏙옙 탈占쏙옙
	public int customerDelete(String cus_num);

	// 회占쏙옙 占쏙옙
	public CustomerVO customerDetail(String cus_num);

	// 처占쏙옙占쏙옙 占쏙옙占쏙옙
	public PresVO presRealDetail(String hos_res_num);

	// 처占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙회 占쏙옙占쏙옙트
	public List<PresDetailVO> cusPresDetailList(String pres_num);

	// 처占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙 占싱몌옙
	public List<String> cusPresDetailMedName(String pres_num);

	// 占쏙옙占쏙옙 占싹깍옙
	public int insertPay(PayVO pay);

	// 占쏙옙占쏙옙占싹뤄옙
	public int updatePay(String pres_num);

	// 처占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public String selectPayCheck(String pres_num);

	// 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public int selectPayPrice(String hos_res_num);

	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public HospitalVO detailHospital(String hos_num);
	
	// 占쏙옙占쏙옙 占쌉뤄옙
	public int symptomInsert(SymptomVO sym);
	
	// 占쏙옙占쏙옙 占싯삼옙 占쏙옙占�
	public SymptomDetailVO symptomDetail(String cus_num);
	
	//占썅국 占쏙옙호 占쏙옙占�
	public String selectPharNum(String phar_name);
	
	//占썅국 占쏙옙占쏙옙占싹깍옙
	int insertPharRes(PharResVO pvo);
		
	// 占썅국 占쏙옙占쏙옙 占쏢세븝옙占쏙옙
	public PharResVO pharResDetail(String phar_res_num);
	
	// 占썅국 占싱몌옙 占쏙옙占쏙옙
	public String selectPharmacyName(String phar_num);
	
	// 占썅국 占쏙옙占쏙옙호 占쏙옙占쏙옙
	public int increasePharResWait(String phar_res_num);
	
	// 占썅국 占쏙옙占쏙옙호 占쏙옙회
	public int detailPharWait(String phar_num);
	
	// 占싯몌옙占쏙옙占�
	public int notifyInsert(HashMap<String, String> map);
	
	// 占쏙옙占쏙옙占싱몌옙 占싼곤옙 占쏙옙占쏙옙
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
	
	
	
}
