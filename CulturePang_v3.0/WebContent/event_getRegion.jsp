<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	String x = request.getParameter("x");
	if(x != null) {
		response.sendRedirect("event_list.jsp?x=" + x);
	}
	
%>
    