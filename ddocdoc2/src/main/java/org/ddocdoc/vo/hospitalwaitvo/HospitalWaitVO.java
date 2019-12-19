package org.ddocdoc.vo.hospitalwaitvo;

import java.io.Serializable;

public class HospitalWaitVO implements Serializable {
	private String cus_num;
	private String hos_num;
	private String hos_res_num;
	private int res_wait;
	
	
	
	public String getCus_num() {
		return cus_num;
	}
	public void setCus_num(String cus_num) {
		this.cus_num = cus_num;
	}
	public String getHos_num() {
		return hos_num;
	}
	public void setHos_num(String hos_num) {
		this.hos_num = hos_num;
	}
	public int getRes_wait() {
		return res_wait;
	}
	public void setRes_wait(int res_wait) {
		this.res_wait = res_wait;
	}
	public String getHos_res_num() {
		return hos_res_num;
	}
	public void setHos_res_num(String hos_res_num) {
		this.hos_res_num = hos_res_num;
	}
	
	
	

}
