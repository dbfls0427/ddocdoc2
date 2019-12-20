package org.ddocdoc.vo.injectvo;

import java.io.Serializable;

public class InjectInfoVO implements Serializable{

	private String inj_info_num; 
	private String inj_info_name;
	private String inj_info_date;
	private String inj_info_price;
	
	public InjectInfoVO() {}
	
	public InjectInfoVO(String inj_info_num, String inj_info_name, String inj_info_date, String inj_info_price) {
		super();
		this.inj_info_num = inj_info_num;
		this.inj_info_name = inj_info_name;
		this.inj_info_date = inj_info_date;
		this.inj_info_price = inj_info_price;
	}

	
	public String getInj_info_num() {
		return inj_info_num;
	}

	public void setInj_info_num(String inj_info_num) {
		this.inj_info_num = inj_info_num;
	}

	public String getInj_info_name() {
		return inj_info_name;
	}

	public void setInj_info_name(String inj_info_name) {
		this.inj_info_name = inj_info_name;
	}

	public String getInj_info_date() {
		return inj_info_date;
	}

	public void setInj_info_date(String inj_info_date) {
		this.inj_info_date = inj_info_date;
	}

	public String getInj_info_price() {
		return inj_info_price;
	}

	public void setInj_info_price(String inj_info_price) {
		this.inj_info_price = inj_info_price;
	}

	
	
}
