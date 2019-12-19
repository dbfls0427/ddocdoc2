package org.ddocdoc.controller.hospitalcontroller;

import org.ddocdoc.mapper.hospitalmapper.HospitalMapperTest;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations =  {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class HospitalControllerTests {
	
	@Setter(onMethod_={@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testInsert() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/hospital/hospitalInsert")
				.param("hos_name", "���̸�")
				.param("hos_tel", "����ȣ")
				.param("hos_addr", "���ּ�")
				.param("hos_time", "���ð�")
				.param("hos_info", "������")
				.param("hos_wait", "1")
				.param("hos_type", "��Ÿ��")
				.param("uuid", "��Ÿ��")
				.param("uploadPath", "��Ÿ��")
				.param("fileName", "��Ÿ��")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	

}
