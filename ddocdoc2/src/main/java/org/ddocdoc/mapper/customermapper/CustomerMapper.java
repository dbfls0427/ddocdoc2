package org.ddocdoc.mapper.customermapper;

import java.util.List;

import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.loginvo.LoginVO;

public interface CustomerMapper {
	int insertCustomer(CustomerVO customer);
	
	CustomerVO loginCustomer(String cus_id);
	
	/*// 병원 번호 출력
	String selectHosNum(String hos_name);
	
	// 병원 예약 입력
	int insertHospitalRes(HospitalResVO hospitalresVO);
	
	// 예약 목록 리스트
	List<HospitalResVO> resList(String cus_num);
	
	// 병원 정보 추출
	HospitalVO detailHospital(String hos_num);
	
	// 병원 이름 추출
	List<String> detailNameHospital(String cus_num);
	
	//예약 상세 내용
	HospitalResVO detailRes(String hos_res_num);
	
	//예약 취소
	int deleteRes(String hos_res_num);
	
	// 예약 취소할 때 대기번호 감소
	int decreaseWait(String hos_num);
	
	// 대기번호 조회
	int detailWait(String hos_res_num);
	
	// 마이페이지 수정
	int customerUpdate(CustomerVO customer);
	
	// 회원 탈퇴
	int customerDelete(String cus_num);
	
	// 처방전 보기
	PresVO presRealDetail(String hos_res_num);
	
	// 처방전 약 명세 조회 리스트
	List<PresDetailVO> cusPresDetailList(String pres_num);
	
	// 처방전 약 명세 약 이름
	List<String> cusPresDetailMedName(String pres_num);
	
	// 결제 하기
	int insertPay(PayVO pay);
	
	// 결제완료
	int updatePay(String pres_num);
	
	// 처방전 결제 여부 추출
	String selectPayCheck(String pres_num);
	
	// 약 가격 추출
	int selectPayPrice(String hos_res_num);
	
	//약국 번호 출력
	String selectPharNum(String phar_name);
	
	//약국 예약하기
	int insertPharRes(PharResVO pvo);
	
	//약국 예약 리스트
	List<PharResVO> pharResList(String cus_num);
	
	//약국 이름 가져오기
	List<String> detailNamePharmacy(String cus_num);
	
	// 약국 예약 상세보기
	PharResVO pharResDetail(String phar_res_num);
	
	// 약국 이름 추출
	String selectPharmacyName(String phar_num);
	
	// 약국 대기번호 증가
	int increasePharResWait(String phar_res_num);
	
	// 약국 대기번호 조회
	int detailPharWait(String phar_num);
	
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
	
	// 조회 수 증가
	int increaseHits(String rv_num);
	
	// 게시글 조회 수 조회
	int detailHits(String rv_num);
	
	// 예약 접수 확인
	String checkResAcpt(String hos_res_num);
	
	// 회원 상세정보
	CustomerVO customerDetail(String cus_num);*/
	

}
