package org.ddocdoc.vo.heightvo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HeightVO {

	private String he_num;
	private Double he_height;
	private Date he_date;
	private String ch_num;
}
