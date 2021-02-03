<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="eventMgr" class="beanPack.EventMgrPool"/>
<%
	response.setCharacterEncoding("UTF-8");
	String[] images = {"assets/1.PNG","assets/2.PNG","assets/3.PNG","assets/4.PNG",
		"assets/5.PNG","assets/6.PNG","assets/7.PNG","assets/8.PNG","assets/9.PNG"};
	String e_selected = request.getParameter("eventNum");
	int eventNum = Integer.parseInt(e_selected);
	EventBean sEvent =  new EventBean();
	sEvent = eventMgr.getContents(eventNum);
	
	String sImg = images[sEvent.getEventNum()-1];
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

<div class="section-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
          <h2 class="text-left">Event</h2>
          
          <div class="section-container-spacer">
          	<table class="table table-boardered">
          	  <tr>
          	  	<td><b><%=sEvent.getEventName() %></b></td>
          	  </tr>
          	  <tr>
				<td>행사 기간 <%=sEvent.getPeriod() %></td>
			  </tr>
			  <tr>
				<td><img src = "<%=sImg %>"></td>
		  	  </tr>
			  <tr>
				<td><%=sEvent.getEventContent() %></td>
			  </tr>
          	</table>
          </div>
		  
       </div>
    </div>
  </div>
</div>


<footer class="footer-container white-text-container">
	<%@ include file="/design/footer.jsp" %>
</footer>

</body>
</html>