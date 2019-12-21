package org.ddocdoc.mapper.checkupmapper;

import java.sql.Date;

import org.ddocdoc.vo.checkupvo.ChildCheckupVO;
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
public class CheckupTest {

		@Setter(onMethod_=@Autowired)
		private CheckupMapper mapper;
		
		/*@Test
		public void testselectCheDetail(){
			mapper.selectCheDetail(map);
		}*/
		
		/*
		@Test
		public void testselectCheList(){
			String ch_num = "CH0021";
			mapper.selectCheList(ch_num);
			log.info("검진 쳇~~~");
		}
		*/
		
		
		
/*		@Test
		public void testListSelectCheInfo(){
			mapper.selectCheInfo();
			log.info("검진텟-리스트추천리스트~~~~");
		}*/
		
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
			log.info("수정 야국텟~~~~~~");
			
			pharmacyVO.setPhar_num(phar_num);
			pharmacyVO.setPhar_name("11aa");
			pharmacyVO.setPhar_tel("수정텟");
			pharmacyVO.setPhar_addr("수정텟");
			pharmacyVO.setPhar_time("수정텟");
			pharmacyVO.setPhar_info("수정텟");
			
			mapper.pharmacyUpdate(pharmacyVO);
		}
		*/
		
		/*
		@Test
		public void testDetail(){
			String phar_num = "P0082";
			
			PharmacyVO pharmacyVO = mapper.pharmacyDetail(phar_num);
			log.info("야국테스트에서 디테일 데이터~~~");
		}
		*/
		
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
			//insert into dd_child_checkup values('CUP00'|| checkup_seq.nextval, 'contents', sysdate, 'CH0021', 'text');
			ChildCheckupVO ccvo = new ChildCheckupVO();
//			ccvo.setCup_num(cup_num);
			ccvo.setCup_content("content");
			ccvo.setCh_num("CH0021");
			ccvo.setChe_memo("blah~");
			mapper.insertChe(ccvo);
			
			
			log.info("검진 새로 등록 테스트에서!");
		}
		*/
		
}
