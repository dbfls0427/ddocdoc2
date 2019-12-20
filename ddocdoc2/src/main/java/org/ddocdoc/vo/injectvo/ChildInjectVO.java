package org.ddocdoc.vo.injectvo;

import java.io.Serializable;
import java.sql.Date;

public class ChildInjectVO implements Serializable{

	private String inj_num;
	private String inj_content;
	private Date inj_date;
	private String ch_num;
	private String inj_memo;
	
	public ChildInjectVO() {}
	
	public ChildInjectVO(String inj_content, Date inj_date, String ch_num, String inj_memo) {
		super();
		this.inj_content = inj_content;
		this.inj_date = inj_date;
		this.ch_num = ch_num;
		this.inj_memo = inj_memo;
	}
	public ChildInjectVO(String inj_num, String inj_content, Date inj_date, String ch_num, String inj_memo) {
		super();
		this.inj_num = inj_num;
		this.inj_content = inj_content;
		this.inj_date = inj_date;
		this.ch_num = ch_num;
		this.inj_memo = inj_memo;
	}
	
	public String getInj_num() {
		return inj_num;
	}

	public void setInj_num(String inj_num) {
		this.inj_num = inj_num;
	}

	public String getInj_content() {
		return inj_content;
	}

	public void setInj_content(String inj_content) {
		this.inj_content = inj_content;
	}

	public Date getInj_date() {
		return inj_date;
	}

	public void setInj_date(Date inj_date) {
		this.inj_date = inj_date;
	}

	public String getCh_num() {
		return ch_num;
	}

	public void setCh_num(String ch_num) {
		this.ch_num = ch_num;
	}

	public String getInj_memo() {
		return inj_memo;
	}
	public void setInj_memo(String inj_memo) {
		this.inj_memo = inj_memo;
	}
	
}
