<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>approvalwrite.jsp</title>
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/_bootswatch.scss">
<link rel="stylesheet" href="../../css/_variables.scss">
</head>
<style>
.table th,
.table td {
  border-top: 3px solid rgba(0, 0, 0, 0.05);
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
<script type="text/javascript">
	$(function() {
		$('#approvalline').click(function() {
			window.open('approval.jsp', 'winzip', 'width=500px height=300px');
		});
		$('#reference').click(function() {
			window.open('reference.jsp', 'winzip', 'width=500px height=300px');
		});
	});
</script>
<body>
	<h2 style="margin: 10px;">보고서 작성</h2>
	<blockquote class="blockquote text-right">
		 <button type="submit" class="btn btn-primary" style="margin: 10px;">Submit</button>
	</blockquote>
	<br>
	<form>
		<table class="table table-hover">
			<tr>
				<td>작성 날짜</td>
				<td>
					<div class="form-group">
						<fieldset>
							<input class="form-control" id="readOnlyInput" type="text"
								placeholder="2018-05-08" readonly="">
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td>기안 일자</td>
				<td>
					<button type="button" class="btn btn-info">날짜</button>
					&nbsp;&nbsp;&nbsp;&nbsp;<label>2018-05-23</label>
				</td>
			</tr>

			<tr class="table-light">
				<td>제목</td>
				<td>
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="Default input" id="inputDefault">
					</div>
				</td>
			</tr>
			<tr class="table-light">
				<td>결제자</td>
				<td><input class="form-control" id="readOnlyInput" type="text"
								placeholder="임채환, 송강현, 박성민" readonly=""
								style='width: 20%; display:inline; '>
					<button type="button" class="btn btn-outline-info"
						id="approvalline">Search</button>
				</td>
			</tr>
			<tr class="table-light">
				<td>참조자</td>
				<td><input class="form-control" id="readOnlyInput" type="text"
								placeholder="임채환, 송강현, 박성민" readonly=""
								style='width: 20%; display:inline; '>
					<button type="button" class="btn btn-outline-info" id="reference">Search</button>
				</td>
			</tr>
			<tr class="table-light">
				<td>구분</td>
				<td>
					<div class="form-group">
						<fieldset>
							<input class="form-control" id="readOnlyInput" type="text"
								placeholder="기안서" readonly="">
						</fieldset>
					</div>
				</td>
			</tr>
			<tr class="table-light">
				<td>전표 또는 그외 첨부</td>
				<td>
					<div class="form-group">
						<input type="file" class="form-control-file" id="exampleInputFile"
							aria-describedby="fileHelp">
							<small id="fileHelp" class="form-text text-muted">
							</small>
					</div>
				</td>
			</tr>
			<tr class="table-light">
				<td colspan="2" id="smarteditor">
					여기는 내용이 들어갈 자리 입니다.
					<br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br>
				 </td>
			</tr>
		
			</tbody>
		</table>
	</form>

</body>
</html>