<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="apple-touch-icon" sizes="180x180" href="./assets/apple-icon-180x180.png">
  	<link href="./assets/favicon.ico" rel="icon">
	<link href="" rel="stylesheet">
	<title>H E A D E R</title>
	<link href="./main.550dcf66.css" rel="stylesheet">
	<% 
	response.setCharacterEncoding("UTF-8");
	boolean log = false;
	String idKey = (String)session.getAttribute("id");
	if(idKey != null){
		log = true;
	}
	%>
</head>
<body>
<nav class="navbar navbar-default active">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./main.jsp" title="">
          <img src="./assets/images/mashup-icon.svg" class="navbar-logo-img" alt="">
          Culture Pang
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="./main.jsp" title="">Home</a></li>
          <li><a href="./event_list.jsp" title="">Events</a></li>
          <li><a href="./board_list.jsp" title="">Boards</a></li>
          
          <%if(!log){ %>
          	<li><a href="./member.jsp" title="">Sign IN</a></li>
          <%}else{ %>
          	<li><a href="./mypage.jsp" title="">My Page</a></li>
          <%} %>
          <li>
            <p>
            <%if(!log){ %>
              <a href="./login.jsp" class="btn btn-default navbar-btn" title="">LogIn</a>
            <%}else{ %>
              <a href="./logout.jsp" class="btn btn-default navbar-btn" title="">LogOut</a>
            <%} %>
            </p>
          </li>

        </ul>
      </div> 
    </div>
  </nav>
  
   <script type="text/javascript" src="./main.0cf8b554.js"></script>
</body>
</html>