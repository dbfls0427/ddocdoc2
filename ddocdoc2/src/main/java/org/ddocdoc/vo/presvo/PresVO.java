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
	private String pres_num;	// 처방전번호
	private Date pres_date;		// 발급일
	private int pres_count;		// 복용횟수
	private String cus_num;		// 고객번호
	private String hos_num;		// 병원번호
	private String hos_res_num; //예약번호
	private String pay_check; // 결제 여부
	
	

	
	
	
}
