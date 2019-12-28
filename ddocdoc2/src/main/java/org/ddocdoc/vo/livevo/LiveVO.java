package org.ddocdoc.vo.livevo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class LiveVO implements Serializable{

	private String live_num;
	private String live_name;
	private int live_count;
	private String live_content;
	private String live_address;
	private String live_hos;
	private String live_start;
	private String live_end;
	private String cus_num;
	public LiveVO(){}
	public LiveVO(String live_name, String live_hos, String cus_num) {
		super();
		this.live_name = live_name;
		this.live_hos = live_hos;
		this.cus_num = cus_num;
	}
	public LiveVO(String live_num, String live_name, int live_count, String live_content, String live_address,
			String live_hos, String live_start, String live_end, String cus_num) {
		super();
		this.live_num = live_num;
		this.live_name = live_name;
		this.live_count = live_count;
		this.live_content = live_content;
		this.live_address = live_address;
		this.live_hos = live_hos;
		this.live_start = live_start;
		this.live_end = live_end;
		this.cus_num = cus_num;
	}
	public LiveVO(String live_num, String cus_num) {
		super();
		this.live_num = live_num;
		this.cus_num = cus_num;
	}
/*	public LiveVO(String live_num, String live_address, String cus_num) {
		this.live_num = live_num;
		this.live_address = live_address;
		this.cus_num = cus_num;
	}*/
	
}
