package org.ddocdoc.vo.presdetailvo;

import java.io.Serializable;
import java.sql.Date;

import org.ddocdoc.vo.presvo.PresVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PresDetailVO implements Serializable {

	private String med_num;
	private String cus_num;
	private int med_count;
	private String hos_res_num;
	private String pres_num;	// ó������ȣ
	
}
