<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserRecord" %>
<%@ page import="user.UserRE" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>근태현황 확인</title>
</head>
<body>
	<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">근태현황 확인</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
			</ul>
			<% 
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<% 		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%		
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">근무일자</th>
						<th style="background-color: #eeeeee; text-align: center;">부서명</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">직급</th>
						<th style="background-color: #eeeeee; text-align: center;">출근시간</th>
						<th style="background-color: #eeeeee; text-align: center;">퇴근시간</th>
						<th style="background-color: #eeeeee; text-align: center;">출근구분</th>
						<th style="background-color: #eeeeee; text-align: center;">퇴근구분</th>
					</tr>
				</thead>
				<tbody>
					<%
					String department_name[] = { "사장실", "임원진", "관리팀", "컨텐츠팀", "개발팀",
				            "고객지원팀", "기획팀", "디자인팀", "업무지원팀" };
					String userRFID = null;
					UserRecord urd = new UserRecord();
					userRFID = urd.getRFID(userID);
					ArrayList<UserRE> list = urd.getUserRecord(userRFID);
					SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
					String workoncf = "", workoffcf = "";
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getW_day()%></td>
						<td><%=department_name[list.get(i).getW_dm_id()]%></td>
						<td><%=list.get(i).getW_e_name()%></td>
						<td><%=list.get(i).getW_e_position()%></td>
						<td><%=sdf.format(list.get(i).getW_workonTime())%></td>
						<td><%=sdf.format(list.get(i).getW_workoffTime())%></td>
						<% 
						if(list.get(i).getW_workoncf() == null) 
						{
							workoncf = "";
						}
						else
						{
							workoncf = list.get(i).getW_workoncf();
						}
						%>
						<td><%=workoncf%></td>
						<%
						if(list.get(i).getW_workoffcf() == null) 
						{
							workoffcf = "";
						}
						else
						{
							workoffcf = list.get(i).getW_workoffcf();
						}
						%>
						<td><%=workoffcf%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>