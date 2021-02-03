<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beanPack.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="uMgr" class="beanPack.UserMgrPool"/>

<%
	String id = (String)session.getAttribute("id");
	String pwd_check = request.getParameter("pwd_check");
	String new_pwd = request.getParameter("new_pwd");
	
	int result = uMgr.updatePwd(id, pwd_check, new_pwd);
	if(result == uMgr.PWD_CHECK_ERROR){%>
		<script>
		alert("기존 비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
	<%}else if(result == uMgr.PWD_UPDATE_ERROR){%>
		<script>
		alert("비밀번호 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
		history.back();
		</script>
	<%}else if(result == uMgr.PWD_UPDATE_SUCCESS){
		session.invalidate();%>
		<script>
		alert("비밀번호 수정에 성공했습니다. 바뀐 비밀번호로 다시 로그인해주세요!");
		location.href="login.jsp";
		</script>
	<%}%>