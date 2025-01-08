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
padding: 0 25px;
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

	String sql = "select tp.p_no, tp.p_name, tl.t_name, "
				+ "substr(t_sdate, 1, 2), substr(t_sdate, 4, 2), substr(t_sdate, 7, 2), "
				+ "tr.t_status, "
				+ "substr(t_ldate, 1, 2), substr(t_ldate, 4, 2), substr(t_ldate, 7, 2), "
				+ "tr.t_result "
				+ "from tbl_patient_202005 tp, tbl_lab_test_202005 tl, tbl_result_202005 tr "
				+ "where tp.p_no = tr.p_no and tl.t_code = tr.t_code ";
	
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header4.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">검사결과조회</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<table border="1" style="border-spacing: 0px">
			<tr>
				<th>환자 코드</th>
				<th>환자 이름</th>
				<th>검사 명</th>
				<th>검사 시작일</th>
				<th>검사 상태</th>
				<th>검사 완료일</th>
				<th>검사 결과</th>
			</tr>
			<%
			while(rs.next()) {
				String str = "";
				
				if(rs.getInt(7) == 1) {
					str = "검사중";
				} else {
					str = "검사완료";
				}
				
				String str2 = "";
				
				if(rs.getString(11).equals("X   ")) {
					str2 = "미입력";
				}else if(rs.getString(11).equals("P   ")) {
					str2 = "양성";
				}else if(rs.getString(11).equals("N   ")) {
					str2 = "음성";
				}
			%>
			<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td>20<%= rs.getString(4) %>-<%= rs.getString(5) %>-<%= rs.getString(6) %></td>
			<td><%= str %></td>
			<td>20<%= rs.getString(8) %>-<%= rs.getString(9) %>-<%= rs.getString(10) %></td>
			<td><%= str2 %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>