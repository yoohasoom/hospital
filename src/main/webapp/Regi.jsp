<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header3.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">검사결과입력</h2>
<br>
<section style="display: flex; justify-content: center;">
	<form action="RegiConfirm.jsp" name="form">
		<table border="1" style="border-spacing: 0px;">
			<tr>
				<th>환자코드</th>
				<td><input type="text" name="p_no">예)1001</td>
			</tr>
			<tr>
				<th>검사명</th>
				<td>
					<select name="t_code">
						<option></option>
						<option value="T001">[T001]결핵</option>
						<option value="T002">[T002]장티푸스</option>
						<option value="T003">[T003]수두</option>
						<option value="T004">[T004]홍역</option>
						<option value="T005">[T005]콜레라</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>검사시작일</th>
				<td><input type="text" name="t_sdate">예)20200101</td>
			</tr>
			<tr>
				<th>검사상태</th>
				<td>
					<input type="radio" name="t_status" value="1">검사 중
					<input type="radio" name="t_status" value="2">검사 완료
				</td>
			</tr>
			<tr>
				<th>검사완료일</th>
				<td><input type="text" name="t_ldate">예)20200101</td>
			</tr>
			<tr>
				<th>검사결과</th>
				<td>
					<input type="radio" name="t_result" value="X">미입력
					<input type="radio" name="t_result" value="P">양성
					<input type="radio" name="t_result" value="N">음성
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="submit" value="등록" onclick="fn_submit(); return false;">
				<input type="reset" value="재입력" onclick="fn_reset();">
				</td>
			</tr>
		</table>
	</form>
</section>
<script type="text/javascript">
function fn_submit() {
	var f = document.form;
	
	if(f.p_no.value == "") {
		alert("환자코드를 입력하세요!");
		f.p_no.focus(); return false;
	}
	if(f.t_code.value == "") {
		alert("검사명을 선택하세요!");
		f.t_code.focus(); return false;
	}
	if(f.t_sdate.value == "") {
		alert("검사시작일을 입력하세요!");
		f.t_sdate.focus(); return false;
	}
	if(f.t_status.value == "") {
		alert("검사상태를 선택하세요!");
		f.t_status.focus(); return false;
	}
	if(f.t_ldate.value == "") {
		alert("검사완료일을 입력하세요!");
		f.t_ldate.focus(); return false;
	}
	if(f.t_result.value == "") {
		alert("검사결과를 선택하세요!");
		f.t_result.focus(); return false;
	}
	f.submit();
}
function fn_reset() {
	var f = document.form;
	
	alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다!");
	f.p_no.focus();
}
</script>
</body>
</html>