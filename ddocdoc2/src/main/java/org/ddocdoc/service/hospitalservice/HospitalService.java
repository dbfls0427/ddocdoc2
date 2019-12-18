package org.ddocdoc.service.hospitalservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddocdoc.vo.hospitalvo.HospitalVO;

public interface HospitalService {

   // insert
   public int hospitalInsert(HospitalVO hospital);
   
   // list
   public List<HospitalVO> hospitalList();
   
   // detail
   public HospitalVO hospitalDetail(String hos_num);
   
   // update
   public int hospitalUpdate(HospitalVO hospitalVO);
   
   // delete
   public int hospitalDelete(String hos_num);
}