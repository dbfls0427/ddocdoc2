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
	private String phar_num;	//�౹��ȣ
	private String phar_name;	//�౹�̸�  
	private String phar_tel; 	//�౹��ȭ��ȣ
	private String phar_addr;	//�౹�ּ�
	private String phar_time;	//�౹�ð�
	private String phar_info;	//�౹����
	private int phar_wait;		//�౹����ȣ
}
