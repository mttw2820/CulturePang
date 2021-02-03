<%@page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.*,java.text.SimpleDateFormat, beanPack.*" %>
<jsp:useBean id="mgr" class="beanPack.UserMgrPool"/>
<jsp:useBean id="bean" class="beanPack.UserBean"/> 
<!-- 폼에서 넘어온 모든 애를 setproperty 해줌  -->
<jsp:setProperty property="*" name="bean"/>

<%
		//가입 날짜 저장
		Date now = new Date();
		SimpleDateFormat joinT = new SimpleDateFormat("yyyyMMdd");
		String joinDate = joinT.format(now);
		bean.setJoinDate(joinDate);
		
		//result가 true면 회원가입 성공
		boolean result = mgr.insertMember(bean);
		String msg = "회원가입에 실패 하였습니다.";
		String location = "member.jsp";
		if(result){
			msg = "회원가입을 하였습니다.";
			location = "login.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>