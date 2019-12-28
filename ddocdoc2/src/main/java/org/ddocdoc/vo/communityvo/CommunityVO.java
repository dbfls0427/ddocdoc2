package org.ddocdoc.vo.communityvo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityVO implements Serializable{
	private String com_num;
	private String com_title;
	private String com_writer;
	private String com_content;
	private String com_date;
	private int com_hits;
	private int com_up;
	private int com_down;
	private String cus_num;
	
	
}
