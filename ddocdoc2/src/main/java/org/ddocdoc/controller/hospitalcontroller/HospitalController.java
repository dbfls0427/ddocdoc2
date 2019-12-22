package org.ddocdoc.controller.hospitalcontroller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.ddocdoc.controller.customercontroller.CustomerController;
import org.ddocdoc.service.hospitalservice.HospitalService;
import org.ddocdoc.vo.childvo.ChildVO;
import org.ddocdoc.vo.customervo.CustomerVO;
import org.ddocdoc.vo.hospitalresvo.HospitalResVO;
import org.ddocdoc.vo.hospitalvo.HospitalVO;
import org.ddocdoc.vo.hospitalwaitvo.HospitalWaitVO;
import org.ddocdoc.vo.medicinevo.MedicineVO;
import org.ddocdoc.vo.presdetailvo.PresDetailVO;
import org.ddocdoc.vo.presvo.PresVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@Controller
@Log4j
@RequestMapping("/hospital/*")
@AllArgsConstructor
public class HospitalController {
	
	private HospitalService service;
	
	
	// list
	@GetMapping("/hospitalList")
	public String hospitalList(Model model){
		log.info("hospitalList~~~~~");
		
		model.addAttribute("list", service.hospitalList());
		
		return "/hospital/hospitalList";
	}
	
	/*
	@GetMapping("/hospitalList")
	public String hospitalList(@RequestParam("hos_num") String hos_num, Model model){
		log.info("hospitalList~~~~~");
		
		model.addAttribute("hospitalList", service.hospitalList(hos_num));
		model.addAttribute("hos_num", hos_num);
		return "/hospital/hospitalList";
	}
	*/
	
	// insert form
	@GetMapping("/hospitalInsert")
	public String hospitalInsert(){
		log.info("hospitalInsert...form");
		return "/hospital/hospitalInsert";
	}
	/*
	@GetMapping("/hospitalInsert")
	public String hospitalInsert(@RequestParam("hos_num") String hos_num, Model model){
		log.info("hospitalInsert...form");
		model.addAttribute("hos_num", hos_num);
		return "/hospital/hospitalInsert";
	}
	*/
	
	// insert
	@RequestMapping(value="/hospitalInsert" , method = {RequestMethod.POST})
	public String hospitalInsert(HospitalVO hospitalVO, RedirectAttributes rttr){
		log.info("insert~: "+ hospitalVO);
		
		try {
			service.hospitalInsert(hospitalVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addAttribute("hos_num", hospitalVO.getHos_num());
		
		
//		rttr.addFlashAttribute("hos_num", hospitalVO.getHos_num());
		
		return "redirect:/hospital/hospitalList";
		
	}
	
	// Detail
	@GetMapping("/hospitalDetail")
	public String hospitalDetail(@RequestParam("hos_num") String hos_num, Model model){
		log.info("hospital Detail");
		model.addAttribute("hospitalvo", service.hospitalDetail(hos_num));
		
		// 蹂묒썝 �삁�빟 �솚�옄 由ъ뒪�듃
		List<HospitalResVO> hospitalresVO = service.hosResList(hos_num);
		
		for(int i = 0; i < hospitalresVO.size(); i++) {
			System.out.println("detailaction�뿉�꽌 " + hospitalresVO.get(i).getHos_res_num() + hospitalresVO.get(i).getHos_acpt());
		}
		
		model.addAttribute("hospitalresVO", hospitalresVO);
		
		return "/hospital/hospitalDetail";
	}
	
	
	// update form
	@GetMapping("/hospitalUpdate")
	public String hospitalUpdate(@RequestParam("hos_num") String hos_num,
			Model model){
		
		model.addAttribute("hos_num", hos_num);
		model.addAttribute("hospitalvo", service.hospitalDetail(hos_num));
		
		return "/hospital/hospitalUpdate";
	}
	
	
	// update
	@RequestMapping(value="/hospitalUpdate" , method = {RequestMethod.POST})
	public String hospitalUpdate(HospitalVO hospitalVO, RedirectAttributes rttr){
		
		try {
			int re = service.hospitalUpdate(hospitalVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("hos_num", hospitalVO.getHos_num());
		
		return "redirect:/hospital/hospitalList";
	}
	
	
	// delete
	@GetMapping("/hospitalDelete")
	public String hospitalDelete(@RequestParam("hos_num") String hos_num, 
			RedirectAttributes rttr){
		        
		service.hospitalDelete(hos_num);
		
		rttr.addFlashAttribute("hos_num", hos_num);
		
		return "redirect:/hospital/hospitalList";
	}
		
	
	
	// getFolder()
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	// uploadAjaxAction
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<HospitalVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("_____________----_");
		
		List<HospitalVO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			HospitalVO attachDTO = new HospitalVO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				

				// add to List
				log.info("ddddd"+attachDTO);
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@GetMapping("/QRCode")
	public String QRCode(){
		log.info("qr~~~~~~~~~~~~~~~~~~~~~~");
		return "/QRCode";
	}
	
	// �삁�빟 �셿猷�
	@GetMapping("/booleanHosRes")
	public String booleanHosRes(@RequestParam String cus_num, @RequestParam String hos_res_num, @RequestParam String hos_num, RedirectAttributes rttr){
		service.booleanHosRes(hos_res_num);
		service.increaseWait(hos_num);
		
		HospitalWaitVO waitVO = new HospitalWaitVO();
		waitVO.setCus_num(cus_num);
		waitVO.setHos_num(hos_num);
		waitVO.setHos_res_num(hos_res_num);
		waitVO.setRes_wait(service.hospitalWait(hos_num));
		service.insertWaitData(waitVO);
		
		rttr.addAttribute("hos_num", hos_num);
		
		return "redirect:/hospital/hospitalDetail";
	}
	
	// 泥섎갑�쟾 �엯�젰 �뤌
	@GetMapping("/presInsertForm")
	public String presInsertForm(@RequestParam String hos_res_num, @RequestParam String hos_num, @RequestParam String cus_num, Model model){
		PresVO pres = service.presDetail();
		String pres_num = pres.getPres_num();
		List<MedicineVO> medicinevo = service.medicineList();
		
		model.addAttribute("medicinevo", medicinevo);
		model.addAttribute("hos_res_num", hos_res_num);
		model.addAttribute("pres_num", pres_num);
		
		return "/pres/presInsertForm";
	}
	
	// 泥섎갑�쟾 �엯�젰
	@GetMapping("/presInsert")
	public String presInsert(PresVO pres, @RequestParam String hos_res_num, @RequestParam String hos_num, @RequestParam String cus_num,RedirectAttributes rttr){
		pres.setCus_num(cus_num);
		pres.setHos_num(hos_num);
		pres.setHos_res_num(hos_res_num);
		service.insertPres(pres);
		
		rttr.addAttribute("hos_res_num", hos_res_num);
		rttr.addAttribute("cus_num", cus_num);
		rttr.addAttribute("hos_num", hos_num);
		return "redirect:/hospital/presInsertForm";
		
	}
	
	// 泥섎갑�쟾 �빟 �엯�젰
	@PostMapping("/medicineInsert")
	public String medicineInsert(PresDetailVO presDetail, @RequestParam String hos_res_num, @RequestParam int med_count,
			@RequestParam String pres_num, @RequestParam String med_num, Model model){
			String cus_num = ((CustomerVO)CustomerController.session.getAttribute("customer")).getCus_num();
			presDetail.setCus_num(cus_num);
			List<MedicineVO> medicinevo = service.medicineList();
			service.insertPreDetail(presDetail);
			
			List<PresDetailVO> list = service.presDetailList(pres_num);
			List<String> list2 = service.presDetailMedName(pres_num);
			
			model.addAttribute("medicine", presDetail);
			model.addAttribute("list", list);
			model.addAttribute("medName", list2);
			model.addAttribute("hos_res_num", hos_res_num);
			model.addAttribute("medicinevo", medicinevo);
			model.addAttribute("hos_res_num", hos_res_num);
			model.addAttribute("pres_num", pres_num);
					
		return "/pres/presInsertForm";
	}
	
	// 占쏙옙占쏙옙 占쏙옙占�
		@GetMapping("/admin")
		public String admin(Model model){

			model.addAttribute("notifyList", service.notifyList());
			model.addAttribute("count", service.notifyCount());
			model.addAttribute("notifyNumList", service.notifyNumList());
			model.addAttribute("notifyHosNameList", service.notifyHosNameList());
			return "/index/admin";
		}
		
		// alram click
		@GetMapping("/alramClick")
		public String alramClick(@RequestParam String not_num, RedirectAttributes rttr){
			System.out.println("ddddd : " + not_num);
			service.notifyUpdate(not_num);
			rttr.addAttribute("hos_num", service.chatHosNum(not_num));
			return "redirect:/hospital/chattingDoctor";
		}
		
		@GetMapping("/chattingDoctor")
		public String chattingDoctor(@RequestParam String hos_num){
			return "/chatting/chatting";
		}
	
}
