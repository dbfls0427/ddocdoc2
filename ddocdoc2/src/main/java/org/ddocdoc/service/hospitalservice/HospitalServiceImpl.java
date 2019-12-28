package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.mapper.hospitalmapper.HospitalMapper;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.notifyvo.NotifyVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HospitalServiceImpl implements HospitalService {

	@Setter(onMethod_ = @Autowired)
	private HospitalMapper mapper;

	@Override
	public int hospitalInsert(HospitalVO hospitalVO) {
		return mapper.hospitalInsert(hospitalVO);
	}

	@Override
	public List<HospitalVO> hospitalList() {
		return mapper.hospitalList();
	}

	@Override
	public HospitalVO hospitalDetail(String hos_num) {
		return mapper.hospitalDetail(hos_num);
	}

	@Override
	public int hospitalUpdate(HospitalVO hospitalVO) {
		return mapper.hospitalUpdate(hospitalVO);
	}

	@Override
	public int hospitalDelete(String hos_num) {
		return mapper.hospitalDelete(hos_num);
	}

	@Override
	public List<HospitalResVO> hosResList(String hos_num) {
		return mapper.hosResList(hos_num);
	}

	@Override
	public int booleanHosRes(String hos_res_num) {
		return mapper.booleanHosRes(hos_res_num);
	}

	@Override
	public int increaseWait(String hos_num) {
		return mapper.increaseWait(hos_num);
	}

	@Override
	public int hospitalWait(String hos_num) {
		return mapper.hospitalWait(hos_num);
	}

	@Override
	public int insertWaitData(HospitalWaitVO waitVO) {
		return mapper.insertWaitData(waitVO);
	}

	@Override
	public List<MedicineVO> medicineList() {
		return mapper.medicineList();
	}

	@Override
	public int insertPreDetail(PresDetailVO presDetail) {
		return mapper.insertPreDetail(presDetail);
	}

	@Override
	public List<PresDetailVO> presDetailList(String pres_num) {
		return mapper.presDetailList(pres_num);
	}

	@Override
	public List<String> presDetailMedName(String pres_num) {
		return mapper.presDetailMedName(pres_num);
	}

	@Override
	public int insertPres(PresVO presVO) {
		return mapper.insertPres(presVO);
	}

	@Override
	public PresVO presDetail() {
		return mapper.presDetail();
	}

	@Override
	public List<String> notifyList() {
		return mapper.notifyList();
	}

	@Override
	public int notifyCount() {
		return mapper.notifyCount();
	}

	@Override
	public List<String> notifyNumList() {
		return mapper.notifyNumList();
	}

	@Override
	public void notifyUpdate(String not_num) {
		mapper.notifyUpdate(not_num);
	}

	@Override
	public List<String> notifyHosNameList() {
		return mapper.notifyHosNameList();
	}

	@Override
	public String chatHosNum(String not_num) {
		return mapper.chatHosNum(not_num);
	}

	/*@Override
	public void imgInsert(HospitalAttachVO hospitalAttachVO) {
		// TODO Auto-generated method stub
		
	}*/

	@Override
	public CustomerVO customerDetail(String cus_num) {
		return mapper.customerDetail(cus_num);
	}
	
}