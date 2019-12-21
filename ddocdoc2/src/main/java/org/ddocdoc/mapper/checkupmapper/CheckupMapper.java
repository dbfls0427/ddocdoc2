package org.ddocdoc.mapper.checkupmapper;

import java.util.HashMap;

import java.util.List;

import org.ddocdoc.vo.checkupvo.CheckupInfoVO;
import org.ddocdoc.vo.checkupvo.ChildCheckupVO;


public interface CheckupMapper {

	// ������õ���� �ҷ�����
	List<CheckupInfoVO> selectCheInfo();

	// ������ ���� �ҷ�����
	List<String> selectCheList(String ch_num);
	
	// ���� ����ϱ�
	int insertChe(ChildCheckupVO ccvo);
	
	// �������� �󼼺���
	ChildCheckupVO selectCheDetail(HashMap<String, String> map);
	
	// �������� ����
	int updateChe(ChildCheckupVO ccvo);
	
	// �������� ���� 
	int deleteChe(HashMap<String, String> map);
	
	// ������ ��������
	int cheCount(String ch_num);
	
	// ��ü��������
	int cheTotal(String ch_num);
}
