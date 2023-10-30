<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/db_connect.jsp"%>
<%
String sql="select a.custno custno, a.custname custname, "
		+ " decode(a.grade,'A','VIP','B','일반','C','직원') g ,sum(nvl(price,0)) p "
		+ "from member_tbl_02 a, money_tbl_02 b "
		+ "where a.custno = b.custno and b.price is not null "
		//+ "where a.custno = b.custno and nvl(b.price,0) > 0 "
		+ "group by a.custno, a.custname, a.grade "
		+ "order by p desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver1.5">

</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<form></form>
		<h3 class="title">회원매출조회</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
				<%
				int totalSales = 0;
				while(rs.next()){
				%>
				<tr align="center">
					<td><%=rs.getString("custno") %></td>
					<td><%=rs.getString("custname") %></td>
					<td><%=rs.getString("g") %></td>
					<td><%=rs.getString("p") %></td>
				</tr>
				<%
			  	  totalSales += rs.getInt("p");}
				%>
				<tr>
					<td colspan="3" align="center">합계</td>
					<td><%= totalSales %></td>
				</tr>
			</table>
		</div>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
