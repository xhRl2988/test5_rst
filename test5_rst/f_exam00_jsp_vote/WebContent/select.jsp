<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
String sql="select v_name, "
 		+" case when substr(v_jumin,7,1) in ('1','2','5','6') then '19' else '20' end "
		+" ||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' birth, "
		+" '만'||(to_char(sysdate,'yyyy') - "
		+" (case when substr(v_jumin,7,1) in ('1','2','5','6') then '19' else '20' end||substr(v_jumin,1,2))-1)||'세' avg, "
		+" decode(substr(v_jumin,7,1), "
		+" '1','남', "
		+" '2','여', "
		+" '3','남', "
		+" '4','여') gender, "
		+" m_no ,substr(v_time,1,2)||':'||substr(v_time,3,2) v_time, "
		+" decode(v_confirm, "
		+" 'Y','확인', "
		+" 'N','미확인') v_confirm " 
		+" from tbl_vote_202005";
 		
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역구의원투표 프로그램</title>	
	<link rel="stylesheet" type="text/css"href="css/style.css?ver1.1.1.12">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id=section>
		<h2 class="title">후보검수조회</h2>
		<div class="scroll" style="overflow: auto; height: 460px;">		<table class="table_line">
			<tr class="table_title">
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr align="center">
				<td><%=rs.getString("v_name") %></td>
				<td><%=rs.getString("birth") %></td>
				<td><%=rs.getString("avg") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("v_time") %></td>
				<td><%=rs.getString("v_confirm") %></td>
			</tr>
			<%
			}
			%>
		</table>
		</div>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>