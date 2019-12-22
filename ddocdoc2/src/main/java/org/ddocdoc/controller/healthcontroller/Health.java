package org.ddocdoc.controller.healthcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/health/*")
public class Health {

	private static String URL = "http://health.chosun.com/list.html";
	
	@GetMapping("/healthList")
	public void getList(Model model) throws IOException{
		
		//문서가져오기
		Document doc = Jsoup.connect(URL).get();
		
/*		//기사제목들
		Elements elements1 = doc.select("#list_area .list_item dt a");
		List<String> titles = new ArrayList<String>();
		
		for(Element element : elements1){
			titles.add(element.text());
		}
		
		//기사내용들
		Elements elements2 = doc.select("#list_area .list_item .desc a");
		List<String> contents = new ArrayList<String>();
		
		for(Element element : elements2){
			contents.add(element.text());
		}
		
		model.addAttribute("titles",titles);
		model.addAttribute("contents",contents);*/
		
		
		Elements elements1 = doc.select("#list_area dl");
		//System.out.println(elements1.toString());
		List<String> ele = new ArrayList<>();
		for(Element element : elements1){
			System.out.println(element);
			ele.add(element.toString());
		}
		model.addAttribute("ele", ele);
	}
}
