<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="mMgr" class="beanPack.UserMgrPool"/>
<%
	  request.setCharacterEncoding("UTF-8");

	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String url = "login.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  
	  int result = mMgr.loginRegister(id,pass);
	  
	  if(result == mMgr.ID_WRONG)	//아이디 오류
		  msg = "존재하지 않는 아이디입니다.";
	  if(result == mMgr.PW_WRONG)	//비밀번호 오류
		  msg = "비밀번호가 일치하지 않습니다.";
	  if(result == mMgr.LOGIN_SUCCESS){//로그인 성공
		  String nickname = mMgr.getNick(id);
		  session.setAttribute("nickname", nickname);
		  session.setAttribute("id", id);
		  url = "main.jsp";
		  msg = "로그인에 성공하였습니다. "+nickname+" ("+id+") "+"님 안녕하세요!";
	  }
%>
<script>
	alert("<%=msg%>");
	top.document.location.reload();
	location.href="<%=url%>";
</script>