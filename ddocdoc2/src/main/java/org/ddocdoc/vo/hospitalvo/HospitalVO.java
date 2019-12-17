package org.ddocdoc.vo.hospitalvo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalVO {
	private String hos_num;		//병원번호
	private String hos_name;	//병원이름
	private String hos_tel;		//병원전화번호
	private String hos_addr;	//병원주소
	private String hos_time;	//병원운영시간
	private String hos_info;	//병원정보
	private int hos_wait;		//병원대기번호
	private String hos_type;	//병원종류
	private String uuid;		//사진명
	private String uploadPath;	//사진경로
	private String fileName;	//원본사진명
}
