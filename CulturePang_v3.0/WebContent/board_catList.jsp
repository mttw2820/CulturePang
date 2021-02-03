<!-- 글 종류 선택 시 해당하는 글들을 보여주도록 조정하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	String cat = request.getParameter("cat");
	if(cat == null) {
		cat = "5";	//CAT_SEARCH
		String key = request.getParameter("searchKey");
		response.sendRedirect("board_list.jsp?cat="+cat+"&searchKey="+key);
	}
	else response.sendRedirect("board_list.jsp?cat=" + cat);
%>
    
