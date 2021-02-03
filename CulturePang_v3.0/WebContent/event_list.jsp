<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	String[] images = {"assets/1.PNG","assets/2.PNG","assets/3.PNG","assets/4.PNG",
		"assets/5.PNG","assets/6.PNG","assets/7.PNG","assets/8.PNG","assets/9.PNG"};
	int set_x =0;
%>
<!DOCTYPE html>
<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="eventMgr" class="beanPack.EventMgrPool"/>
<html>
<head>
<meta charset="UTF-8">

<title>문화 행사 정보 게시판</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

  <div class="section-container">
    <div class="container text-center">
      <div class="row section-container-spacer">
        <div class="col-xs-12 col-md-12">
          <h1>Events</h1>
        </div>
        <p align="left">
        	
			<b>지역 선택</b>&nbsp;&nbsp;
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.ALL %>'">전체</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.GYEONGGI %>'">경기도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.GANGWON %>'">강원도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.CHOONGCHUNG %>'">충청도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.GYUNGSANG %>'">경상도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.JUNRA %>'">전라도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.JEJU %>'">제주도</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.SEOUL %>'">서울특별시</button>
		</p>
		<p align="left">
			<b>행사 종류 선택</b>&nbsp;&nbsp;
				<button class="btn btn-info btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.ALL %>'">전체</button>
				<button class="btn btn-info btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.A %>'">지역축제</button>
				<button class="btn btn-info btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.B %>'">전시공연</button>
				<button class="btn btn-info btn-sm" onclick="location.href='event_getRegion.jsp?x=<%=eventMgr.C %>'">체육행사</button>
		</p>  
      </div>
      <div class="row">
      
      	<%
      		//DB에서 게시글 목록 받아오기
			Vector<EventBean> elist = new Vector<EventBean>();
			
			if(request.getParameter("x") == null){
				set_x = eventMgr.ALL;
			}
			else {
				set_x = Integer.parseInt(request.getParameter("x"));
			}
			elist = eventMgr.getEventMember(set_x);
			
			int elistLen = elist.size(); 
			EventBean eb = new EventBean();
			int cnt = 0;
			
			for(int i=0; i<elistLen; i++){
				eb = elist.get(i);	
				String lImg = images[eb.getEventNum()-1];
		%>
        <div class="col-xs-12 col-md-4">
          <img src="<%=lImg %>" style="height:200px; max-width:300px ; width:auto" alt="" class="reveal img-responsive reveal-content image-center">
          <br>
          <p style="font-size:20px"><b><a href="event_getContents.jsp?eventNum=<%=eb.getEventNum()%>"><%=eb.getEventName() %></a></b></p>
          <h4><%=eb.getPeriod() %></h4>
        </div>
        <%		
        	} %>
      </div>
      <br>
	  total events : <%=elistLen%>
    </div>
  </div>
 

<footer class="footer-container white-text-container">
<%@ include file="/design/footer.jsp" %>
</footer>

</body>

</html>