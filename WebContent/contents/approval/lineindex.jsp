<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lineregistration.jsp</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/_bootswatch.scss">
<link rel="stylesheet" href="../../css/_variables.scss">
<link rel="stylesheet" href="../../css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	<script type="text/javascript">
	$(function() {
		$('#createline').click(function() {
			window.open('approval.jsp', 'winzip', 'width=500px height=300px');
		});
	});
</script>
</head>
<body>
	<h2 style="margin: 20px;">결재 라인 목록</h2>

	<table class="table table-hover">
		<tr class="table-success">
			<td>순번</td>
			<td>결재 라인 명칭</td>
			<td></td>
		</tr>
		<tr>
			<td>1</td>
			<td>OO 프로젝트 결재 라인<br>
			[결재] 개발팀 임채환 사원<br>
			[결재] 개발팀 이하영 대리<br>
			[결재] 개발팀 한아연 팀장
			</td>
			<td><i class="fas fa-trash-alt"></i></td>
		</tr>
		<tr>
			<td>2</td>
			<td>★★ 발주 결재 라인</td>
		</tr>
		<tr>
			<td>3</td>
			<td>@@ 인사부 결재 라인</td>
		</tr>
		<tr>
			<td>4</td>
			<td>회식비 결재 라인</td>
		</tr>
		<tr>
			<td>5</td>
			<td>휴가계 결재 라인</td>
		</tr>
		<tr>
			<td>6</td>
			<td>&&&&& 구매 품의서 결재 라인</td>
		</tr>
		<tr>
			<td>7</td>
			<td>## 프로젝트 결재 라인</td>
		</tr>
	</table>
	<button type="button" class="btn btn-success" style="margin: 5px;" id="createline">결재 라인 만들기</button>
	<button type="button" class="btn btn-outline-danger">삭제</button>
</body>
</html>