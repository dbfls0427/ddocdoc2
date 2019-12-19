package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.mapper.hospitalmapper.HospitalMapper;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
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

}