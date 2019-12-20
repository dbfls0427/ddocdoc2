package org.ddocdoc.service.customerservice;

import java.util.List;

import org.ddocdoc.vo.customervo.CustomerAuthVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.payvo.PayVO;
import org.ddocdoc.vo.pharresvo.PharResVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.ddocdoc.vo.symptomvo.SymptomVO;

public interface CustomerService {

	public void insertCustomer(CustomerVO customer);

	// 로그인 세션넣기
	public CustomerVO loginCustomer(String cus_id);

	// 병원 번호 가져오기
	public String selectHosNum(String hos_name);

	// 병원 예약
	public void insertHospitalRes(HospitalResVO hospitalresVO);

	// 예약 리스트
	public List<HospitalResVO> resList(String cus_num);

	// 병원 이름 추출
	public List<String> detailNameHospital(String cus_num);

	// 약국 예약 리스트
	public List<PharResVO> pharResList(String cus_num);

	// 약국 이름 가져오기
	public List<String> detailNamePharmacy(String cus_num);

	// 예약 상세 내용
	public HospitalResVO detailRes(String hos_res_num);

	// 예약 접수 확인
	public String checkResAcpt(String hos_res_num);

	// 대기번호 조회
	public int detailWait(String hos_res_num);

	// 마이페이지 수정
	public int customerUpdate(CustomerVO customer);

	// 회원 탈퇴
	public int customerDelete(String cus_num);

	// 회원 상세
	public CustomerVO customerDetail(String cus_num);

	// 처방전 보기
	public PresVO presRealDetail(String hos_res_num);

	// 처방전 약 명세 조회 리스트
	public List<PresDetailVO> cusPresDetailList(String pres_num);

	// 처방전 약 명세 약 이름
	public List<String> cusPresDetailMedName(String pres_num);

	// 결제 하기
	public int insertPay(PayVO pay);

	// 결제완료
	public int updatePay(String pres_num);

	// 처방전 결제 여부 추출
	public String selectPayCheck(String pres_num);

	// 약 가격 추출
	public int selectPayPrice(String hos_res_num);

	// 병원 정보 추출
	public HospitalVO detailHospital(String hos_num);
	
	// 증상 입력
	public int symptomInsert(SymptomVO sym);
}
