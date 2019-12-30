package org.ddocdoc.vo.termvo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO2 {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria2 cri2;
	
public PageDTO2(Criteria2 cri2, int total){
		
		this.cri2 = cri2;
		this.total = total;
		

		this.endPage = (int)(Math.ceil(cri2.getPageNum() / 5.0)) * 5;
		this.startPage = this.endPage - 4;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri2.getAmount()));
		
		if (realEnd < this.endPage){
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
