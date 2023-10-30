<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="select custno, custname, phone, address, joindate, grade, city from member_tbl_02 order by custno";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="css/style.css?ver1.1.1.4">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>


	<main id="section">
		<h3 class="title">홈쇼핑 회원 등록</h3>
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>회원전화</th>
					<th>회원주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>도시코드</th>
					<th>수정 및 삭제</th>
				</tr>
				<%
				while(rs.next()){ 
				%>
				<tr>
					<td><%=rs.getString("custno") %></td>
					<td><%=rs.getString("custname") %></td>
					<td><%=rs.getString("phone") %></td>
					<td><%=rs.getString("address") %></td>
					<td><%=rs.getString("joindate") %></td>
					<td><%=rs.getString("grade") %></td>
					<td><%=rs.getString("city") %></td>
					<td  align="center">
						<input type="submit" value="수정">
						<input type="button" value="삭제" onclick="location.href='join.jsp'">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
					</td>
				</tr>
				<%
				} 
				%>
			</table>
	</main>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	<%
	/* rs.close();
	pstmt.close(); */
	conn.close();
	%>
</body>
</html>