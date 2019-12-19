package org.ddocdoc.vo.payvo;

import java.io.Serializable;

public class PayVO implements Serializable {
	private String pay_num;
	private String pay_type;
	private String cus_num;
	private String pres_num;
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getCus_num() {
		return cus_num;
	}
	public void setCus_num(String cus_num) {
		this.cus_num = cus_num;
	}
	public String getPres_num() {
		return pres_num;
	}
	public void setPres_num(String pres_num) {
		this.pres_num = pres_num;
	}

	
	
}
