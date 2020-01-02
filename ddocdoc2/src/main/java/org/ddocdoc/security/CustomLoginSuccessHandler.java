package org.ddocdoc.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.customerservice.CustomerService;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Setter(onMethod_ = @Autowired)
	private CustomerService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		CustomerController.session = request.getSession();
		
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
			
			
		});
		
		
		if(roleNames.contains("ROLE_MEMBER")){
//			request.setAttribute("cus_id", request.getParameter("username"));
			CustomerVO customer = service.loginCustomer(request.getParameter("username"));
			CustomerController.session.setAttribute("customer", customer);
			response.sendRedirect("/customer/loginSuccess");
			return;
		}
		if(roleNames.contains("ROLE_ADMIN")){
			CustomerVO customer = service.loginCustomer(request.getParameter("username"));
			CustomerController.session.setAttribute("admin", customer);
			response.sendRedirect("/hospital/admin");
			return;
		} 
		
		
	}

}
