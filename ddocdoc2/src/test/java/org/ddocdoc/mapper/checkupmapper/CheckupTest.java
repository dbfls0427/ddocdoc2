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
			log.info("���� ��~~~");
		}
		*/
		
		
		
/*		@Test
		public void testListSelectCheInfo(){
			mapper.selectCheInfo();
			log.info("������-����Ʈ��õ����Ʈ~~~~");
		}*/
		
		/*
		@Test
		public void testDelete(){
			String phar_num = "P0082";
			log.info("�߱����� ���� �׽�");
			mapper.pharmacyDelete(phar_num);
		}
		*/
		
		/*
		@Test
		public void testUpdate(){
			String phar_num = "P0083";
			
			PharmacyVO pharmacyVO = new PharmacyVO();
			log.info("���� �߱���~~~~~~");
			
			pharmacyVO.setPhar_num(phar_num);
			pharmacyVO.setPhar_name("11aa");
			pharmacyVO.setPhar_tel("������");
			pharmacyVO.setPhar_addr("������");
			pharmacyVO.setPhar_time("������");
			pharmacyVO.setPhar_info("������");
			
			mapper.pharmacyUpdate(pharmacyVO);
		}
		*/
		
		/*
		@Test
		public void testDetail(){
			String phar_num = "P0082";
			
			PharmacyVO pharmacyVO = mapper.pharmacyDetail(phar_num);
			log.info("�߱��׽�Ʈ���� ������ ������~~~");
		}
		*/
		
		/*
		@Test
		public void testList(){
			mapper.pharmacyList();
			log.info("�౹ ����Ʈ in �׽�Ʈ~~~");
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
			
			
			log.info("���� ���� ��� �׽�Ʈ����!");
		}
		*/
		
}
