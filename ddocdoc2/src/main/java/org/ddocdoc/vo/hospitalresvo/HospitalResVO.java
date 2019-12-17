package org.ddocdoc.vo.hospitalresvo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HospitalResVO implements Serializable {
	private String hos_res_num;
	private String hos_res_type;
	private String hos_res_sym;
	private String hos_res_memo;
	private String hos_res_date;
	
	private String hos_res_time;
	private String cus_num;
	private String hos_num;
	private String hos_acpt;		//병원예약접수
	
	
	
	
}
