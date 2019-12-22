package org.ddocdoc.vo.notifyvo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotifyVO implements Serializable{
	private String not_num;
	private String cus_num;
	private String hos_num;
	private String not_check;
}
