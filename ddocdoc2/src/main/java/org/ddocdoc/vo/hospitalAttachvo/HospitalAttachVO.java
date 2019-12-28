package org.ddocdoc.vo.hospitalAttachvo;

import java.io.Serializable;

import org.ddocdoc.vo.hospitalvo.HospitalVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalAttachVO implements Serializable{
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String hos_num;
	//private boolean image;
	
	
}
