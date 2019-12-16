package org.ddocdoc.mapper.childmapper;

import static org.junit.Assert.*;

import java.util.List;

import org.ddocdoc.vo.childvo.ChildVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChildMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ChildMapper mapper;
	
	//아이리스트 테스트
/*	@Test
	public void test() {
		
		String ch_num = "COO1";
		List<ChildVO> list = mapper.childList(ch_num);
		
		list.forEach(i -> log.info(list));

	
	}*/

}