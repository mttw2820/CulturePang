<%@ page contentType="text/html; charset=UTF-8"%>
<%
	  request.setCharacterEncoding("UTF-8");
	  String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<title>로그인</title>
</head>

<header>
	<%@ include file="/design/header.jsp" %>
</header>
        
	<!-- log는 header에서 로그인 상태를 확인하는 변수이다. -->
 	<!-- 로그인 상태라면 메인 페이지로 이동 / 아니면 로그인 진행 -->
	<%if (log) { %>
	
		<script>
		alert(idKey + "님 안녕하세요! 이미 로그인 상태입니다."
				+ "Culture Pang의 여러 기능을 사용하실 수 있습니다.");
		location.herf= "main.jsp";
		</script>
		
	<%} else {%>
	
	<div class="section-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">	
	
		<h1 class="text-center"> LOGIN </h1>
		<br>
		
		<!-- <div class="text-center"> -->
		<div align="center">
		<div class="card-container">
		<div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<table style="height:10%">
				<tr>
					<td width="30%">아 이 디</td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td>비밀번호 </td>
					<td><input type="password" name="pwd" value=""></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인" class="btn btn-primary btn-sm" style="width:45%" onclick="loginCheck()">
			&nbsp;
			<input type="button" value="회원가입" class="btn btn-info btn-sm" style="width:45%" onClick="location.href='member.jsp'" >
		</form>
		</div>
		</div>
		</div>
		</div>
	  </div>
	</div>
	</div>		
		<%}%>

	
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