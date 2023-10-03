<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="select * from tbl_member_202005";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역구의원투표 프로그램</title>	
	<link rel="stylesheet" type="text/css"href="css/style.css?ver1.1.1.8">
	<script type="text/javascript">
			function checkValue(){
				var cv = document.data;
				
				if(!cv.v_jumin.value){
					alert("주민번호 입력되지 않았습니다!")
					cv.v_jumin.focus();
					return false;
				}
				if(!cv.v_name.value){
					alert("성명이 입력되지 않았습니다!.")
					cv.v_name.focus();
					return false;
				}
				if(!cv.m_no.value){
					alert("후보번호가 선택되지 않았습니다!")
					cv.m_no.focus();
					return false;
				}
				if(!cv.v_time.value){
					alert("투표시간이 입력되지 않았습니다!")
					cv.v_time.focus();
					return false;
				}
				if(!cv.v_area.value){
					alert("투표장소가 입력되지 않았습니다!")
					cv.v_area.focus();
					return false;
				}
			    if (!cv.v_confirm.value) {
			        alert("유권자 확인 선택되지 않았습니다!");
			        return false;
			    }
			}
			function checkReset(){
				location.href="join.jsp";
				alert("정보를 지우고 처음부터 다시 입력합니다!");
		}

		</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id=section>
		<h2 class="title">투표하기</h2>
			<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="v_jumin" size="20" autofocus> 예)890101200021 </td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="v_name" size="20" autofocus> </td>
			</tr>
			<tr>
				<th>후보번호</th>
                <td>
                	<select name="m_no" id="m_no">
                	<option value="">후보번호</option>
                		<% sql = "select m_no,m_name from tbl_member_202005";
                   		 pstmt=conn.prepareStatement(sql);
                    	 rs =  pstmt.executeQuery();
                       	while(rs.next()) {
                    	%>
                   	 	<option value=<%=rs.getString("m_no") %>>[<%=rs.getString("m_no") %>]<%=rs.getString("m_name") %>
                    	<% } %>
                   	</select>
            	</td>
            </tr>
			<tr>
				<th>투표시간</th>
				<td><input type="text" name="v_time" size="10" autofocus> 예) 0930 (09시30분) </td>
			</tr>
			<tr>
				<th>투표장소</th>
				<td><input type="text" name="v_area" size="20" autofocus> </td>
			</tr>
			<tr>
				<th>유권자확인</th>
				<td>
					<input type="radio" name="v_confirm" value="Y">확인
					<input type="radio" name="v_confirm" value="N">미확인
				</td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="투표하기">
					<input type="button"  value="다시쓰기" onclick="checkReset();">
				</td>
			</tr>
		</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>