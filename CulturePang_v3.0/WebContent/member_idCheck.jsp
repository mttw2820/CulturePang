<%@ page contentType="text/html; charset=UTF-8" %>
<!-- usebean -->
<jsp:useBean id="mMgr" class="beanPack.UserMgrPool" />
<%
	request.setCharacterEncoding("UTF-8");
	//URL로 넘겨준 id 받아서 
	String id = request.getParameter("id");
	//checkId 메소드 호출
	boolean result = mMgr.checkId(id);
	int len = id.length();
%>
<html>
<head>
<title>ID 중복체크</title>
	<link href="" rel="stylesheet">
	<link href="./main.550dcf66.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<br/><b><%=id%></b>
		
		<%
			if(len<3){
				out.println("이 아이디는 너무 짦은 것 같지 않나요?<p/>");
			}else{
				if (result) {
					out.println("는 이미 존재하는 ID입니다.<p/>");
				} else {
					out.println("는 사용 가능 합니다.<p/>");
				}
			}
		%>
		<p><a href="#" class="btn btn-primary btn-sm" onClick="self.close()">닫기</a></p>
	</div>
</body>
</html>