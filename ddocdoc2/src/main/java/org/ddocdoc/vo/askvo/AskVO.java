package org.ddocdoc.vo.askvo;

import java.io.Serializable;
import java.util.List;

import org.ddocdoc.vo.hospitalAttachvo.HospitalAttachVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AskVO implements Serializable {
	
	private String ask_num;
	private String ask_title;
	private String ask_content;
	
}
