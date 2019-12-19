package org.ddocdoc.vo.medicinevo;

import java.io.Serializable;

public class MedicineVO implements Serializable {
	private String med_num;
	private String med_name;
	private int med_price;
	
	public MedicineVO() {}

	public MedicineVO(String med_num, String med_name, int med_price) {
		super();
		this.med_num = med_num;
		this.med_name = med_name;
		this.med_price = med_price;
	}

	public String getMed_num() {
		return med_num;
	}

	public void setMed_num(String med_num) {
		this.med_num = med_num;
	}

	public String getMed_name() {
		return med_name;
	}

	public void setMed_name(String med_name) {
		this.med_name = med_name;
	}

	public int getMed_price() {
		return med_price;
	}

	public void setMed_price(int med_price) {
		this.med_price = med_price;
	}

	
	
}
