package org.ddocdoc.vo.termvo;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TermVO implements Serializable {

	private String term_num;
	private String term_title;
	private String term_content;
	
}
