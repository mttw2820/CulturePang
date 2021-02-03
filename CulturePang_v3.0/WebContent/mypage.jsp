<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="uMgr" class="beanPack.UserMgrPool"/>
<%
	response.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	if(id==null){%>
		<script>
		alert("MY PAGE 서비스는 회원만 이용가능합니다. 로그인해주세요.");
		location.href="login.jsp";
		</script>
	<%}
	UserBean myBean = uMgr.getMember(id);
%>

<title>M Y P A G E</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

  <div class="section-container">
    <div class="container text-center">
      <div class="row section-container-spacer">
        <div class="col-xs-12 col-md-12">
          <h2 class="text-center">My Page</h2>
          <p>회원 정보를 확인하고 수정하실 수 있습니다.</p>
        </div>  
      </div>
    </div>
    
    <div class="container">
      <div align="center">
		<div class="card-container">
		<div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
		<div class="row">
			<table style="width:60%; height: 120%">
				<tr>
					<td style="width:30%"><b>아이디</b></td>
					<td><%=id %></td>
				</tr>
				<tr>
					<td><b>별명</b></td>
					<td><%=myBean.getNickname() %></td>
				</tr>
				<tr>
					<td><b>가입날짜</b></td>
					<td><%=myBean.getJoinDate() %></td>
				</tr>
				<tr>
					<td><b>생년월일</b></td>
					<td><%=myBean.getBirth() %></td>
				</tr>
				<tr>
					<td><b>이메일 주소</b></td>
					<%if(myBean.getEmailAdd()!=null){ %>
						<td><%=myBean.getEmailAdd() %></td>
					<%}else{ %>
						<td>이메일 계정을 등록해주세요! </td>
					<%} %>
				</tr>
				<tr>
					<td><b>핸드폰 번호</b></td>
					<%if(myBean.getPhoneNum()!=null){ %>
						<td><%=myBean.getPhoneNum() %></td>
					<%}else{ %>
						<td>핸드폰 번호를 등록해주세요! </td>
					<%} %>
				</tr>
			</table>
			<br>
			<div align="center">
            <p><a href="mypage_update.jsp" class="btn btn-info btn-sm" style="width:55%">회원 정보 수정</a></p>
            <p><a href="mypage_pwdUpdate.jsp" class="btn btn-primary btn-sm" style="width:55%">비밀번호 변경</a></p>
      	</div>
      	</div>
      	</div>
		</div>
	  </div>
    </div>
  </div>
	
<footer class="footer-container white-text-container">
	<%@ include file="/design/footer.jsp" %>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navActivePage();
    scrollRevelation('.reveal');
  });
</script>

<script type="text/javascript" src="./main.0cf8b554.js"></script>

</body>
</html>