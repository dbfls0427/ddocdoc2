package org.ddocdoc.vo.hospitalvo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalVO {
	private String hos_num;		//������ȣ
	private String hos_name;	//�����̸�
	private String hos_tel;		//������ȭ��ȣ
	private String hos_addr;	//�����ּ�
	private String hos_time;	//������ð�
	private String hos_info;	//��������
	private int hos_wait;		//��������ȣ
	private String hos_type;	//��������
	private String uuid;		//������
	private String uploadPath;	//�������
	private String fileName;	//����������
}
