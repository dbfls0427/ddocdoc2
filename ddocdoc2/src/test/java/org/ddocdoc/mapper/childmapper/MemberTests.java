package org.ddocdoc.mapper.childmapper;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	
	@Test
	public void test() {
		String sql = "insert into dd_customer values('C00' || customer_seq.nextval, ?, ?, ?, ?, ?, ?, '1')";
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode("dbsxo12"));
				
				pstmt.setString(1, "user");
				pstmt.setString(3, "±èÀ±ÅÂ");
				pstmt.setString(4, "µ¶»êµ¿");
				pstmt.setString(5, "dbsxo9@naver.com");
				pstmt.setString(6, "05/02/03");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null){try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				if(con != null){try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
				}
			}
		}
	
	}
}
