package org.ddocdoc.vo.customervo;

import java.io.Serializable;
import java.sql.Date;

public class CustomerVO implements Serializable{
	private String cus_num;
	private String cus_id;
	private String cus_pw;
	private String cus_name;
	private String cus_addr;
	private String cus_email;
	private Date cus_birth;
	public String getCus_num() {
		return cus_num;
	}
	public void setCus_num(String cus_num) {
		this.cus_num = cus_num;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pw() {
		return cus_pw;
	}
	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_addr() {
		return cus_addr;
	}
	public void setCus_addr(String cus_addr) {
		this.cus_addr = cus_addr;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	public Date getCus_birth() {
		return cus_birth;
	}
	public void setCus_birth(Date cus_birth) {
		this.cus_birth = cus_birth;
	}
	
	
	
	

}
