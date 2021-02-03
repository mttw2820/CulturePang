<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="postingMgr" class="beanPack.BoardMgrPool"/>
<jsp:useBean id="bean" class="beanPack.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	boolean result = postingMgr.setNewPosting(bean);
	String message = "! 게시글 업로드 중 오류 발생 !";
	String location = "board_list.jsp";
	
	if(result){
		message = "새로운 게시글 작성 완료 !";
		//새로운 게시글 작성된 화면으로 넘어가기
		location = "board_list.jsp";
	}
%>
<script>
	alert("<%=message%>");
	location.href="<%=location%>";
</script>
</body>
</html>