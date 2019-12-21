package org.ddocdoc.vo.checkupvo;

import java.io.Serializable;
import java.sql.Date;

import org.ddocdoc.vo.hospitalresvo.HospitalResVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChildCheckupVO implements Serializable{

	private String cup_num;
	private String cup_content;
	private Date cup_date;
	private String ch_num;
	private String che_memo;
	
}
