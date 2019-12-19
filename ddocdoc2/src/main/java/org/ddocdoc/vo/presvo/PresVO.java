package org.ddocdoc.vo.presvo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PresVO implements Serializable{
	private String pres_num;	// ó������ȣ
	private Date pres_date;		// �߱���
	private int pres_count;		// ����Ƚ��
	private String cus_num;		// ����ȣ
	private String hos_num;		// ������ȣ
	private String hos_res_num; //�����ȣ
	private String pay_check; // ���� ����
	
	

	
	
	
}
