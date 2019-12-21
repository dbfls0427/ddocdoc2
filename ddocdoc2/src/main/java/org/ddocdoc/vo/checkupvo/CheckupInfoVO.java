package org.ddocdoc.vo.checkupvo;

import java.io.Serializable;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckupInfoVO implements Serializable{

	private String che_info_num; 
	private String che_info_name;
	private String che_info_date;
	private String che_info_price;
	
}
