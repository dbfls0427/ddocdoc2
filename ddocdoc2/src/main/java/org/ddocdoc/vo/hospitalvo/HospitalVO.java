package org.ddocdoc.vo.hospitalvo;

import java.io.Serializable;
import java.util.List;

import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalVO implements Serializable {
	private String hos_num;		//
	private String hos_name;	//
	private String hos_tel;		//
	private String hos_addr;	//
	private String hos_time;	//
	private String hos_info;	//
	private int hos_wait;		//
	private String hos_type;	//
	
	private List<HospitalAttachVO> attachList; 

}
