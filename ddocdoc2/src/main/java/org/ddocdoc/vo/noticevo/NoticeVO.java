package org.ddocdoc.vo.noticevo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO implements Serializable {
	private String not_num;		//
	private String not_title;	//
	private String not_writer;		//
	private String not_content;	//
	private String not_date;	//
}
