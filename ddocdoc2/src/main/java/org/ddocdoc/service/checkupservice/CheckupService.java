package org.ddocdoc.service.checkupservice;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;
import org.ddocdoc.vo.injectvo.ChildInjectVO;
import org.ddocdoc.vo.injectvo.InjectInfoVO;


public interface CheckupService {
	

	// ������õ���� �ҷ�����
	public List<CheckupInfoVO> selectCheInfo();

	// ������ ���� �ҷ�����
	public List<String> selectCheList(String ch_num);
	
	// ���� ����ϱ�
	public int insertChe(ChildCheckupVO ccvo);
	
	// �������� �󼼺���
	public ChildCheckupVO selectCheDetail(HashMap<String, String> map);
	
	// �������� ����
	public int updateChe(ChildCheckupVO ccvo);
	
	// �������� ���� 
	public int deleteChe(HashMap<String, String> map);
	
	// ������ ��������
	public int cheCount(String ch_num);
	
	// ��ü��������
	public int cheTotal(String ch_num);
}
