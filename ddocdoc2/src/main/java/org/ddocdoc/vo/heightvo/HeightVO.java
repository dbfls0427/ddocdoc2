package org.ddocdoc.vo.heightvo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HeightVO implements Serializable{

	private String he_num;
	private Double he_height;
	private Date he_date;
	private String ch_num;
}
