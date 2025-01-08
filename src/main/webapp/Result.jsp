<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
padding: 0 15px;
}
td {
text-align: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select tp.p_city, count(*) "
				+ "from tbl_patient_202005 tp, tbl_result_202005 tr " 
				+ "where tp.p_no = tr.p_no "
				+ "group by tp.p_city "
				+ "order by tp.p_city ";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header5.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">지역별검사건수</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<table border="1" style="border-spacing: 0px;">
			<tr>
				<th>지역 코드</th>
				<th>지역명</th>
				<th>검사건수</th>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(1).equalsIgnoreCase("10") ? "서울" : rs.getString(1).equalsIgnoreCase("20") ? "경기" : rs.getString(1).equalsIgnoreCase("30") ? "강원" : (rs.getString(1).equalsIgnoreCase("40") ? "대구" : "")%></td>
			<td><%= rs.getString(2) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>