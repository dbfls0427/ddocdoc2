package org.ddocdoc.vo.symptomdetailvo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SymptomDetailVO implements Serializable{
	private String symptomexamplename;
	private String symptomexampledetail;
	private String symptomsolution;
	
}
