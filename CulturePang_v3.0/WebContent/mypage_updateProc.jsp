<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="uMgr" class="beanPack.UserMgrPool"/>
<jsp:useBean id="uBean" class="beanPack.UserBean"/>
<jsp:setProperty name="uBean" property="*"/>
<%
	boolean result = uMgr.updateMember(uBean);
	if(result){%>
		<script type="text/javascript">
			alert("회원정보 수정 하였습니다.");
			location.href="mypage.jsp";
		</script>
	<%}else{%>
		<script>
			alert("회원정보 수정에 실패 하였습니다.");
			history.back();
		</script>
	<%} %>