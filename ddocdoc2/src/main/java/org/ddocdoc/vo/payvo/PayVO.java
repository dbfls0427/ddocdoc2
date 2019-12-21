package org.ddocdoc.vo.payvo;

import java.io.Serializable;

import org.ddocdoc.vo.pharmacyvo.PharmacyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayVO implements Serializable {
	private String pay_num;
	private String pay_type;
	private String cus_num;
	private String pres_num;
	
}
