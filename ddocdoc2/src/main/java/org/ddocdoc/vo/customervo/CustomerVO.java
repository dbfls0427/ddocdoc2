package org.ddocdoc.vo.customervo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerVO implements Serializable{
	private String cus_num;
	private String cus_id;
	private String cus_pw;
	private String cus_name;
	private String cus_addr;
	private String cus_email;
	//private Date cus_birth;

	

}
