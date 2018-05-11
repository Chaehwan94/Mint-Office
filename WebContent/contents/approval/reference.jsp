<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reference.jsp</title>
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/_bootswatch.scss">
<link rel="stylesheet" href="../../css/_variables.scss">
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script>
$(function(){
	window.resizeTo(900,600);
	$('#cancle').click(function() {
		window.close();
	});

});
</script>
</head>
<body>
<h4 style="margin: 10px;">참조자 선택</h4>
<div style="margin: 5px; border: 1px solid">
	<div style="margin: 10px; border: 1px solid; width: 45%; display: inline-block;">
		<div style="margin: 10px; display: inline-block;">직원 선택</div>
		<div class="form-group" style="display: inline; margin: 10px">
			<input type="text" class="form-control" placeholder="사용자 검색"
				id="inputDefault" style="width: 40%; display: inline;">
		</div>
		<button type="button" class="btn btn-info" style="margin: 10px;">검색</button>
		<div class="list-group" style="margin: 10px;">
			<a href="#" class="list-group-item list-group-item-action">기획팀
				임채환 직원</a> <i class="fas fa-trash-alt"></i>
				<a href="#" class="list-group-item list-group-item-action">기획팀
				임채환 직원</a> 
				<a href="#" class="list-group-item list-group-item-action">기획팀
				임채환 직원</a>
		</div>
	</div>
	<div style="margin: 10px; border: 1px solid; width: 40%; display: inline-block;">
		<div style="margin: 10px;">
		<div style="display: inline;">현 참조자</div>
		<div style="display: inline-block; float: right; ">초기화 </div>
		</div>
		<div class="list-group" style="margin: 10px;">
			
			<a href="#" class="list-group-item list-group-item-action">
    			<select class="custom-select" style="width: 30%">
      				<option selected="">선택</option>
      				<option value="1">검토</option>
      				<option value="2">부재</option>
      				<option value="3">결정</option>
    			</select>
   			&nbsp;&nbsp;기획팀 임채환 직원
			</a>
		</div>
	</div>
</div>
	<div align="right" style="margin: 10px;">
	<button type="button" class="btn btn-danger" id="cancle">취소</button>
	<button type="button" class="btn btn-success">확인</button>
	</div>

</body>
</html>