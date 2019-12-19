package org.ddocdoc.vo.presdetailvo;

import java.io.Serializable;

public class PresDetailVO implements Serializable {

	private String med_num;
	private String cus_num;
	private int med_count;
	private String hos_res_num;
	private String pres_num;	// 처방전번호
	
	public PresDetailVO() {}


	public PresDetailVO(String med_num, String cus_num, int med_count, String hos_res_num, String pres_num) {
		super();
		this.med_num = med_num;
		this.cus_num = cus_num;
		this.med_count = med_count;
		this.hos_res_num = hos_res_num;
		this.pres_num = pres_num;
	}








	public String getMed_num() {
		return med_num;
	}

	public void setMed_num(String med_num) {
		this.med_num = med_num;
	}


	public int getMed_count() {
		return med_count;
	}

	public void setMed_count(int med_count) {
		this.med_count = med_count;
	}

	public String getCus_num() {
		return cus_num;
	}

	public void setCus_num(String cus_num) {
		this.cus_num = cus_num;
	}



	public String getHos_res_num() {
		return hos_res_num;
	}



	public void setHos_res_num(String hos_res_num) {
		this.hos_res_num = hos_res_num;
	}


	public String getPres_num() {
		return pres_num;
	}


	public void setPres_num(String pres_num) {
		this.pres_num = pres_num;
	}
	
	
	
	
	
	
}
