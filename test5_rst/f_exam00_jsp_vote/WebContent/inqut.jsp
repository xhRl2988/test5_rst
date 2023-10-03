<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
String sql="select a.m_no, a.m_name, count(b.m_no) count "
		+" from tbl_member_202005 a, tbl_vote_202005 b "
		+ "where a.m_no = b.m_no and v_confirm='Y' "
		+" group by a.m_no, a.m_name "
		+" order by count desc,a.m_no";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역구의원투표 프로그램</title>	
	<link rel="stylesheet" type="text/css"href="css/style.css?ver1.1.1.8">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id=section>
		<h2 class="title">후보자등수</h2>
		<table class="table_line">
			<tr class="table_title">
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr align="center">
				<td><%=rs.getString("m_no") %></td>
				<td style="width: 100px;"><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("count") %></td>
			</tr>
			<%
			}
			%>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>