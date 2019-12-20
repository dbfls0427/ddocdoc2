package org.ddocdoc.mapper.pharmacymapper;

import org.ddocdoc.mapper.hospitalmapper.HospitalMapperTest;
import org.ddocdoc.vo.pharmacyvo.PharmacyVO;
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
public class PharmacyTest {

		@Setter(onMethod_=@Autowired)
		private PharmacyMapper mapper;
		/*
		@Test
		public void testDelete(){
			String phar_num = "P0082";
			log.info("야국에서 딜릿 테슷");
			mapper.pharmacyDelete(phar_num);
		}
		*/
		
/*		
		@Test
		public void testUpdate(){
			String phar_num = "P0083";
			
			PharmacyVO pharmacyVO = new PharmacyVO();
			
			pharmacyVO.setPhar_num(phar_num);
//			pharmacyVO.setPhar_name("aa");
			pharmacyVO.setPhar_tel("수정텟");
			pharmacyVO.setPhar_addr("수정텟");
			pharmacyVO.setPhar_time("수정텟");
			pharmacyVO.setPhar_info("수정텟");
			pharmacyVO.setPhar_wait(11);
			
			mapper.pharmacyUpdate(pharmacyVO);
			log.info("수정 야국텟~~~~~~");
		}
		*/
		
		
		@Test
		public void testDetail(){
			String phar_num = "P0082";
			
			PharmacyVO pharmacyVO = mapper.pharmacyDetail(phar_num);
			log.info("야국테스트에서 디테일 데이터~~~");
		}
		
		/*
		@Test
		public void testList(){
			mapper.pharmacyList();
			log.info("약국 리스트 in 테스트~~~");
		}
		*/
		
		/*
		@Test
		public void testInsert(){
			PharmacyVO pharmacyVO = new PharmacyVO();
			pharmacyVO.setPhar_num("P00101");
			pharmacyVO.setPhar_name("22강약중강약");
			pharmacyVO.setPhar_tel("9280334");
			pharmacyVO.setPhar_addr("서울시");
			pharmacyVO.setPhar_time("21:00");
			pharmacyVO.setPhar_info("약국메모~");
			pharmacyVO.setPhar_wait(2);
			
			mapper.pharmacyInsert(pharmacyVO);
			
			log.info("약국 새로 등록 테스트에서!");
		}
		*/
		
}
