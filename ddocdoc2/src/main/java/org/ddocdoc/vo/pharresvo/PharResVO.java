package org.ddocdoc.vo.pharresvo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PharResVO implements Serializable{

	private String phar_res_num;
	private String phar_res_time;
	private String phar_res_memo;
	private String cus_num;
	private String phar_num;
	
	

	
}
