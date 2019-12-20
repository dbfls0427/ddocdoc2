package org.ddocdoc.vo.pharmacyvo;

import java.io.Serializable;

import org.ddocdoc.vo.hospitalvo.HospitalVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PharmacyVO implements Serializable{	
	private String phar_num;	//약국번호
	private String phar_name;	//약국이름  
	private String phar_tel; 	//약국전화번호
	private String phar_addr;	//약국주소
	private String phar_time;	//약국시간
	private String phar_info;	//약국정보
	private int phar_wait;		//약국대기번호
}
