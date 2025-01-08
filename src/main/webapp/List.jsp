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

String sql = "select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2), p_gender, p_tel1, p_tel2, p_tel3, p_city "
			+ "from tbl_patient_202005 ";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header2.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">환자조회</h2>
<br>
<section style="display: flex; justify-content: center;">
<table border="1" style="border-spacing: 0px">
<tr>
<th>환자 코드</th>
<th>환자 이름</th>
<th>환자 생년월일</th>
<th>환자 성별</th>
<th>환자 전화번호</th>
<th>환자 거주지</th>
</tr>
<%
while(rs.next()) {
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %>년<%= rs.getString(4) %>월<%= rs.getString(5) %>일</td>
<td><%= rs.getString(6).equalsIgnoreCase("M") ? "남" : (rs.getString(6).equalsIgnoreCase("F") ? "여" : "")%></td>
<td><%= rs.getString(7) %>-<%= rs.getString(8) %>-<%= rs.getString(9) %></td>
<td><%= rs.getString(10).equalsIgnoreCase("10") ? "서울" : rs.getString(10).equalsIgnoreCase("20") ? "경기" : rs.getString(10).equalsIgnoreCase("30") ? "강원" : (rs.getString(10).equalsIgnoreCase("40") ? "대구" : "")%></td>
</tr>
<%
}
%>
</table>
</section>
</body>
</html>