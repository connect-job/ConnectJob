package com.connect.job.common;

public class PageBarFactory {

	public static String getPageBar(int total, int cPage, int numPerPage) {
		String pageBar = "";
	
		int totalPage = (int)Math.ceil((double)total/numPerPage);
		int pageBarSize = 10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		pageBar += "<ul>";
		
		if(pageNo==1) {
			pageBar += "<li>이전</li>";
		} else {
			pageBar += "<li onclick='fn_paging(\"" + (pageNo-1) + "\")'>이전</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo > totalPage)) {
			if(cPage==pageNo) {
				pageBar += "<li class='active'>" + pageNo + "</li>";
			} else {
				pageBar += "<li onclick='fn_paging(\"" + pageNo + "\")'>" + pageNo + "</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<li>다음</li>";
		} else {
			pageBar += "<li onclick='fn_paging(\"" + pageNo + "\")'>다음</li>";
		}
		
		pageBar += "</ul>";
		return pageBar;
	}

}
