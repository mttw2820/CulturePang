<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="eMgr" class="beanPack.EventMgrPool"/>
<jsp:useBean id="bMgr" class="beanPack.BoardMgrPool"/>
<%
	response.setCharacterEncoding("UTF-8");
	String[] images = {"assets/1.PNG","assets/2.PNG","assets/3.PNG","assets/4.PNG",
		"assets/5.PNG","assets/6.PNG","assets/7.PNG","assets/8.PNG","assets/9.PNG"};
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>Insert title here</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

<!-- 고정 메뉴 아래 넓은 메인 공간 -->
  <div class="hero-full-container background-image-container white-text-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <h1>Culture Pang</h1>
          <p>Welcome to Culture Pang! Made by Go & Yum </p>
        </div>
      </div>
    </div>
  </div>
  
  <div class="section-container">
    <div class="container text-center">
      <div class="row section-container-spacer">
        <div class="col-xs-12 col-md-12">
          <h2>Various Events</h2>
          <p>컬쳐팡은 다양한 문화 행사 정보를 제공합니다.<br> 상업적인 목적이 아니라 더 많은 사람들이 문화행사를 접하도록 최대한 다양한 정보를 제공하려 노력합니다.
          	<br>
          	(비회원도 이용가능 서비스입니다.)
          </p>
        </div>  
      </div>
      <div class="row">
      
      	<!-- 최근 이벤트 3개의 정보를 가져온다. -->
      	<%
      		Vector<EventBean> elist = eMgr.getEventMember(0);
      		int eLen = elist.size();
      		String eventImg = "";
      		
      		for(int i=eLen-1; i>eLen-4; i--){
      			EventBean currentEvent = elist.get(i);
      			eventImg = images[currentEvent.getEventNum()-1];
      	%>
        <div class="col-xs-12 col-md-4">
          <img src="<%=eventImg %>" style="height:200px; max-width:300px ; width:auto" alt="" class="reveal img-responsive reveal-content image-center">
          <br>
          <p style="font-size:20px"><b><%=currentEvent.getEventName() %></b></p>
          <h4><%=currentEvent.getPeriod() %></h4>
        </div>
        <%} %>
      </div>
    </div>
  </div>
  
  <div class="section-container">
    <div class="container">
      <div class="row">      
          <div class="col-xs-12" align="center">
          <h2>Event Video</h2>
          <div align="center">
          	<!-- Youtube Video -->
			<iframe width="789" height="444" src="https://www.youtube.com/embed/R231rv_VSJ0?rel=0;amp;autoplay=1" frameborder="0" allowfullscreen></iframe>
		  </div>
     	  </div>  
      </div>  
    </div>
  </div>
  
  <div class="section-container">
    <div class="container text-center">
      <div class="row section-container-spacer">
        <div class="col-xs-12 col-md-12">
          <h2>Talk with Other Users</h2>
          <p>행사정보를 얻는 것만으로 끝나지 않습니다.<br>행사 후기를 모아보고, 개인 전시 정보를 얻을 수 있습니다.
          <br>다른 회원들과 이야기해보는 건 어떤가요?
          </p>
        </div>  
      </div>
      <div class="row">
      
      	<!-- 최근 포스팅 3개의 정보를 가져온다. -->
      	<%
      		Vector<BoardBean> blist = bMgr.getBoardRegister(0);
      		int bLen = blist.size();
      		
      		for(int i=bLen-1; i>bLen-4; i--){
      			BoardBean currentPosting = blist.get(i);
      	%>
        <div class="col-xs-12 col-md-4">
          <br>
          <p >
          <b>" <%=currentPosting.getTitle() %> "</b>
           _ <%=currentPosting.getWriter() %>
          </p>
        </div>
        <%} %>
      </div>
    </div>
  </div>
  
    <div class="section-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
          <div class="text-center">
            <h2>About Culture Pang</h2>
            <p>'컬쳐팡'은 전국의 문화행사 정보를 제공하고, 후기를 공유할 수 있는 플랫폼입니다. 
            <br>
           	회원가입을 하시면 개인전을 홍보하거나, 행사 후기글도 작성할 수 있습니다.
           	<br>
           	더 많은 서비스를 위해 컬쳐팡에 회원가입해보세요!
            </p>
            <p><a href="./member.jsp" class="btn btn-primary btn-lg">회원가입하기</a></p>
          </div>
       </div>
      </div>
    </div>
  </div>
  
  
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navbarFixedTopAnimation();
  });
</script>

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