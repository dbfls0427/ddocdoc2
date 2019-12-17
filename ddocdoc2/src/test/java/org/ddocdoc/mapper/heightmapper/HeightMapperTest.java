package org.ddocdoc.mapper.heightmapper;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.List;

import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.heightvo.HeightVO;
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
public class HeightMapperTest {

	@Setter(onMethod_ = @Autowired)
	private HeightMapper mapper;
	
	@Test
	public void test() {
		/*String ch_num = "CH001";
		List<HeightVO> list = mapper.heightList(ch_num);
		
		list.forEach(i -> log.info(list));*/
		
		/*HeightVO vo = new HeightVO();
		
		vo.setCh_num("CH001");
		vo.setHe_height(120.5);
		
		Date date = new Date(2019, 12, 17);
		
		vo.setHe_date(date);
		
		mapper.heightInsert(vo);*/
		
		
		int count = mapper.heightDelete("HE003");
		
		log.info("deleteCount : " + count);
	}

}
