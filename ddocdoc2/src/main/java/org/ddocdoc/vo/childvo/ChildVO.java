package org.ddocdoc.vo.childvo;

import java.io.Serializable;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChildVO implements Serializable{

	private String ch_num;
	private String ch_name;
	private Date ch_birth;
	private int ch_age;
	private String ch_gender;
	private String cus_num;
	
	public ChildVO(String ch_name, Date ch_birth, int ch_age, String ch_gender, String cus_num) {
		super();
		this.ch_name = ch_name;
		this.ch_birth = ch_birth;
		this.ch_age = ch_age;
		this.ch_gender = ch_gender;
		this.cus_num = cus_num;
	}

	public ChildVO(String ch_name, Date ch_birth, int ch_age, String ch_gender) {
		super();
		this.ch_name = ch_name;
		this.ch_birth = ch_birth;
		this.ch_age = ch_age;
		this.ch_gender = ch_gender;
	}
}
