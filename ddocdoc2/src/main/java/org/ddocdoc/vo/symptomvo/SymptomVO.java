package org.ddocdoc.vo.symptomvo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SymptomVO implements Serializable{
	private String symptom;
	private String detailSymptom;
	private String cus_num;
}
