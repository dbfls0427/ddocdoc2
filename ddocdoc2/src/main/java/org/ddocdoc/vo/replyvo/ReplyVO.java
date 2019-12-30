package org.ddocdoc.vo.replyvo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ReplyVO {
	private int rep_num;
	private String rep_writer;
	private String rep_content;
	private String rep_date;
	private String com_num;
	
	public ReplyVO(){}

	public ReplyVO(String rep_writer, String rep_content, String com_num) {
		super();
		this.rep_writer = rep_writer;
		this.rep_content = rep_content;
		this.com_num = com_num;
	}

	public ReplyVO(int rep_num, String rep_writer, String rep_content, String rep_date, String com_num) {
		super();
		this.rep_num = rep_num;
		this.rep_writer = rep_writer;
		this.rep_content = rep_content;
		this.rep_date = rep_date;
		this.com_num = com_num;
	}
	
	
	
}
