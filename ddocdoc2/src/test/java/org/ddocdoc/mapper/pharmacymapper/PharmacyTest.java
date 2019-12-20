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
			log.info("�߱����� ���� �׽�");
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
			pharmacyVO.setPhar_tel("������");
			pharmacyVO.setPhar_addr("������");
			pharmacyVO.setPhar_time("������");
			pharmacyVO.setPhar_info("������");
			pharmacyVO.setPhar_wait(11);
			
			mapper.pharmacyUpdate(pharmacyVO);
			log.info("���� �߱���~~~~~~");
		}
		*/
		
		
		@Test
		public void testDetail(){
			String phar_num = "P0082";
			
			PharmacyVO pharmacyVO = mapper.pharmacyDetail(phar_num);
			log.info("�߱��׽�Ʈ���� ������ ������~~~");
		}
		
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
			PharmacyVO pharmacyVO = new PharmacyVO();
			pharmacyVO.setPhar_num("P00101");
			pharmacyVO.setPhar_name("22�����߰���");
			pharmacyVO.setPhar_tel("9280334");
			pharmacyVO.setPhar_addr("�����");
			pharmacyVO.setPhar_time("21:00");
			pharmacyVO.setPhar_info("�౹�޸�~");
			pharmacyVO.setPhar_wait(2);
			
			mapper.pharmacyInsert(pharmacyVO);
			
			log.info("�౹ ���� ��� �׽�Ʈ����!");
		}
		*/
		
}
