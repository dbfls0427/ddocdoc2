package org.ddocdoc.vo.childvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChildVO {

	private String ch_num;
	private String ch_name;
	private int ch_age;
	private Date ch_birth;
	private String ch_gender;
	private String cus_num;
}
