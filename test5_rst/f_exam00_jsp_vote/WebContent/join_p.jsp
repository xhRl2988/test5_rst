<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	try{
		request.setCharacterEncoding("UTF-8");
		String sql="insert into TBL_VOTE_202005 values (?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt= conn.prepareStatement(sql);
		
		pstmt.setString(1,request.getParameter("v_jumin"));				//주민번호
		pstmt.setString(2,request.getParameter("v_name")); 				//성명
		pstmt.setString(3,request.getParameter("m_no"));				//후보번호
		pstmt.setString(4,request.getParameter("v_time"));				//투표시간
		pstmt.setString(5,request.getParameter("v_area")); 				//투표장소
		pstmt.setString(6,request.getParameter("v_confirm")); 			//유권자확인
		
		pstmt.executeUpdate();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역구의원투표 프로그램</title>	
</head>
	<body>
		<jsp:forward page="join.jsp"></jsp:forward>
	</body>
</html>