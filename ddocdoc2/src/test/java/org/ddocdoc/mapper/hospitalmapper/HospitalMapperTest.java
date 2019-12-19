package org.ddocdoc.mapper.hospitalmapper;

import static org.junit.Assert.*;

import java.util.List;

import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HospitalMapperTest {

	@Setter(onMethod_=@Autowired)
	private HospitalMapper mapper;
	
	@Test
	public void testResList(){
		String hos_num = "H0022";
		log.info("����ȯ�ڸ���Ʈ~~~~~~~~mapper �׽�Ʈ~Ȯ��!");
		mapper.hosResList(hos_num);
	}
	
	
	
	/*
	@Test
	public void testDelete(){
		String hos_num = "H0066";
		log.info("����");
		mapper.hospitalDelete(hos_num);
	}
	*/
	
	/*
	@Test
	public void testUpdate(){
		String hos_num = "H0021";
		
		HospitalVO hospitalVO = new HospitalVO();
		hospitalVO.setHos_num(hos_num);
		hospitalVO.setHos_name("1-1�����׽�Ʈ�Ͼ�");
		hospitalVO.setHos_tel("1111112");
		hospitalVO.setHos_addr("2");
		hospitalVO.setHos_time("3");
		hospitalVO.setHos_info("lllll");
		hospitalVO.setHos_type("d");
//		hospitalVO.setUuid("5");
		hospitalVO.setUploadPath("33");
		hospitalVO.setFileName("f");
		
		mapper.hospitalUpdate(hospitalVO);
		log.info("����"+mapper.hospitalUpdate(hospitalVO));
		
	}
	*/
	
	/*
	@Test
	public void testDetail(){
		String hos_num = "H0021";
		HospitalVO hospitalvo = mapper.hospitalDetail(hos_num);
		log.info("detail");
	}
	*/
	
	/*
	@Test
	public void test() {
		
		List<HospitalVO> list = mapper.hospitalList();
		
		list.forEach(i -> log.info(list));
		log.info("����Ʈ �Ͼ�");
	
	}
	*/
	
/*	
	@Test
	public void testinsertHospital(){
		
		HospitalVO hospitalVO = new HospitalVO();
		hospitalVO.setHos_num("H00199");
		hospitalVO.setHos_name("2�׽�Ʈ�Ͼ�");
		hospitalVO.setHos_tel("1111112");
		hospitalVO.setHos_addr("2");
		hospitalVO.setHos_time("3");
		hospitalVO.setHos_info("lllll");
		hospitalVO.setHos_wait(7);
		hospitalVO.setHos_type("d");
		hospitalVO.setUuid("5");
		hospitalVO.setUploadPath("33");
		hospitalVO.setFileName("f");
		
		mapper.hospitalInsert(hospitalVO);
		
		log.info("���� ���� ���2");
	}
	
	*/
	
}
