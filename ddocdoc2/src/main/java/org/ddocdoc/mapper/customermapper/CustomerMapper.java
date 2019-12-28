package org.ddocdoc.mapper.customermapper;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.communityvo.CommunityVO;
import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.loginvo.LoginVO;
import org.ddocdoc.vo.noticevo.NoticeVO;
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
	
	// 占쏙옙占쏙옙 占쏙옙호 占쏙옙占�
	String selectHosNum(String hos_name);
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌉뤄옙
	int insertHospitalRes(HospitalResVO hospitalresVO);
	
	// 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙트
	List<HospitalResVO> resList(String cus_num);
	
    // 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	HospitalVO detailHospital(String hos_num);
	
	// 占쏙옙占쏙옙 占싱몌옙 占쏙옙占쏙옙
	List<String> detailNameHospital(String cus_num);
	
	//占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	HospitalResVO detailRes(String hos_res_num);
	
	// Cancel Hospital Reservation
    int deleteRes(String hos_res_num);
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙 占쏙옙占쏙옙호 占쏙옙占쏙옙
//	int decreaseWait(String hos_num);
	
	// 占쏙옙占쏙옙호 占쏙옙회
	int detailWait(String hos_res_num);
	
	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	int customerUpdate(CustomerVO customer);
	
	// 회占쏙옙 탈占쏙옙
	int customerDelete(String cus_num);
	
	// 처占쏙옙占쏙옙 占쏙옙占쏙옙
	PresVO presRealDetail(String hos_res_num);
	
	// 처占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙회 占쏙옙占쏙옙트
	List<PresDetailVO> cusPresDetailList(String pres_num);
	
	// 처占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙 占싱몌옙
	List<String> cusPresDetailMedName(String pres_num);
	
	// 占쏙옙占쏙옙 占싹깍옙
	int insertPay(PayVO pay);
	
	// 占쏙옙占쏙옙占싹뤄옙
	int updatePay(String pres_num);
	
	// 처占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	String selectPayCheck(String pres_num);
	
	// 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	int selectPayPrice(String hos_res_num);
	
	//占썅국 占쏙옙호 占쏙옙占�
	String selectPharNum(String phar_name);
	
	//占썅국 占쏙옙占쏙옙占싹깍옙
	int insertPharRes(PharResVO pvo);
	
	//占썅국 占쏙옙占쏙옙 占쏙옙占쏙옙트
	List<PharResVO> pharResList(String cus_num);
	
	//占썅국 占싱몌옙 占쏙옙占쏙옙占쏙옙占쏙옙
	List<String> detailNamePharmacy(String cus_num);
	
	// 占썅국 占쏙옙占쏙옙 占쏢세븝옙占쏙옙
	PharResVO pharResDetail(String phar_res_num);
	
	// 占썅국 占싱몌옙 占쏙옙占쏙옙
	String selectPharmacyName(String phar_num);
	
	// 占썅국 占쏙옙占쏙옙호 占쏙옙占쏙옙
	int increasePharResWait(String phar_res_num);
	
	// 占썅국 占쏙옙占쏙옙호 占쏙옙회
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
	
	// 占쏙옙회 占쏙옙 占쏙옙占쏙옙
	int increaseHits(String rv_num);
	
	// 占쌉시깍옙 占쏙옙회 占쏙옙 占쏙옙회
	int detailHits(String rv_num);
	*/
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
	String checkResAcpt(String hos_res_num);
	
	// 회占쏙옙 占쏙옙占쏙옙占쏙옙
	CustomerVO customerDetail(String cus_num);
	
	// 占쏙옙占쏙옙 占쌉뤄옙
	int symptomInsert(SymptomVO sym);
	
	// 占쏙옙占쏙옙 占싯삼옙 占쏙옙占�
	SymptomDetailVO symptomDetail(String cus_num);
	
	// 占싯몌옙占쏙옙占�
	int notifyInsert(HashMap<String, String> map);
	
	// 占쏙옙占쏙옙占싱몌옙 占싼곤옙 占쏙옙占쏙옙
	String hospitalOneName(String hos_num);
	
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
	List<NoticeVO> noticeList();

	// notice detail
	NoticeVO noticeDetail(String not_num);
	
	
}
