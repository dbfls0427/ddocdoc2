package org.ddocdoc.mapper.customermapper;

import java.util.HashMap;
import java.util.List;

import org.ddocdoc.vo.askvo.AskVO;
import org.ddocdoc.vo.communityvo.CommunityVO;
import org.ddocdoc.vo.communityvo.Criteria;
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
import org.ddocdoc.vo.termvo.Criteria2;
import org.ddocdoc.vo.termvo.TermVO;

public interface CustomerMapper {
	int insertCustomer(CustomerVO customer);
	
	CustomerVO loginCustomer(String cus_id);
	
	void insertCustomerAuth(CustomerAuthVO cusAuth);
	
	String cusNumSelect(String cus_id);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�샇 �뜝�룞�삕�뜝占�
	String selectHosNum(String hos_name);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙃琉꾩삕
	int insertHospitalRes(HospitalResVO hospitalresVO);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�듃
	List<HospitalResVO> resList(String cus_num);
	
    // �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	HospitalVO detailHospital(String hos_num);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕
	List<String> detailNameHospital(String cus_num);
	
	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	HospitalResVO detailRes(String hos_res_num);
	
	// Cancel Hospital Reservation
    int deleteRes(String hos_res_num);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�뜝�룞�삕
//	int decreaseWait(String hos_num);
	
	// �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�쉶
	int detailWait(String hos_res_num);
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	int customerUpdate(CustomerVO customer);
	
	// �쉶�뜝�룞�삕 �깉�뜝�룞�삕
	int customerDelete(String cus_num);
	
	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	PresVO presRealDetail(String hos_res_num);
	
	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�쉶 �뜝�룞�삕�뜝�룞�삕�듃
	List<PresDetailVO> cusPresDetailList(String pres_num);
	
	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�떛紐뚯삕
	List<String> cusPresDetailMedName(String pres_num);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�떦源띿삕
	int insertPay(PayVO pay);
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�떦琉꾩삕
	int updatePay(String pres_num);
	
	// 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	String selectPayCheck(String pres_num);
	
	// �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	int selectPayPrice(String hos_res_num);
	
	//�뜝�뛿援� �뜝�룞�삕�샇 �뜝�룞�삕�뜝占�
	String selectPharNum(String phar_name);
	
	//�뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕
	int insertPharRes(PharResVO pvo);
	
	//�뜝�뛿援� �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�듃
	List<PharResVO> pharResList(String cus_num);
	
	//�뜝�뛿援� �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	List<String> detailNamePharmacy(String cus_num);
	
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕 �뜝�룫�꽭釉앹삕�뜝�룞�삕
	PharResVO pharResDetail(String phar_res_num);
	
	// �뜝�뛿援� �뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕
	String selectPharmacyName(String phar_num);
	
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�뜝�룞�삕
	int increasePharResWait(String phar_res_num);
	
	// �뜝�뛿援� �뜝�룞�삕�뜝�룞�삕�샇 �뜝�룞�삕�쉶
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
	
	// �뜝�룞�삕�쉶 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	int increaseHits(String rv_num);
	
	// �뜝�뙃�떆源띿삕 �뜝�룞�삕�쉶 �뜝�룞�삕 �뜝�룞�삕�쉶
	int detailHits(String rv_num);
	*/
	// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
	String checkResAcpt(String hos_res_num);
	
	// �쉶�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	CustomerVO customerDetail(String cus_num);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�뙃琉꾩삕
	int symptomInsert(SymptomVO sym);
	
	// �뜝�룞�삕�뜝�룞�삕 �뜝�떙�궪�삕 �뜝�룞�삕�뜝占�
	SymptomDetailVO symptomDetail(String cus_num);
	
	// �뜝�떙紐뚯삕�뜝�룞�삕�뜝占�
	int notifyInsert(HashMap<String, String> map);
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�떛紐뚯삕 �뜝�떬怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕
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
	
	List<CommunityVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	// AnQ list
	List<AskVO> askList();
	
	// term list
	List<TermVO> termList();

	// term detail
	TermVO termDetail(String term_num);
	
	// term pagination
	List<TermVO> getListWithPaging2(Criteria2 cri2);
		
	// term page
	int getTotalCount2(Criteria2 cri2);

		
	
}
