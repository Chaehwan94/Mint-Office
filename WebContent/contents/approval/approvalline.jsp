<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/_bootswatch.scss">
<link rel="stylesheet" href="../../css/_variables.scss">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	window.resizeTo(700,800);

});
</script>
</head>
<body>
<h2 style="margin: 10px;">내 결제 라인</h2>
<table class="table table-hover">
    <tr class="table-active" >
      <td style="font-size: 32px;">이름</td>
      <td>
      <div class="form-group" style="display:inline;">
  <input type="text" class="form-control" placeholder="Default input" 
  id="inputDefault"style="width:40%; display:inline;">
	</div>
      <button type="button" class="btn btn-outline-info"
						id="approvalline">Search</button>
      </td>
    </tr>
</table>


<ul class="list-group">
  <li class="list-group-item  justify-content-between align-items-center">
  <div class="form-group" style="display: inline;">
    <select class="custom-select" style="width: 15%">
      <option selected="">선택</option>
      <option value="1">검토</option>
      <option value="2">부재</option>
      <option value="3">결정</option>
    </select>
  </div>
	<h4 style="display: inline; margin-left: 5px;">대리 국찬호 인사팀</h4>
  </li>
  
  <li class="list-group-item  justify-content-between align-items-center">
  	<div class="form-group" style="display: inline;">
    <select class="custom-select" style="width: 15%">
      <option selected="">선택</option>
      <option value="1">검토</option>
      <option value="2">부재</option>
      <option value="3">결정</option>
    </select>
  </div>
  	<h4 style="display: inline; margin-left: 5px;">사원 박성민 개발팀</h4>
  </li>
  <li class="list-group-item  justify-content-between align-items-center">
  	<div class="form-group" style="display: inline;">
    <select class="custom-select" style="width: 15%">
      <option selected="">선택</option>
      <option value="1">검토</option>
      <option value="2">부재</option>
      <option value="3">결정</option>
    </select>
  </div>
  	<h4 style="display: inline; margin-left: 5px;">이사 임채환 기획팀</h4>
  </li>
  <li class="list-group-item  justify-content-between align-items-center">
  	<h3>OO 프로젝트 결재 라인</h3>
  	<h4>[결정] 과장 신사임당 </h4>
  	<h4>[결정] 부장 김구 </h4>
  	<h4>[결정] 사장 피카츄  </h4>
  </li>
  <li class="list-group-item justify-content-between align-items-center">
   <h3>OO 프로젝트 결재 라인</h3>
  	<h4>[결정] 사원 김용진 </h4>
  	<h4>[대리] 차장 이순신 </h4>
  	<h4>[부재] 팀장 유관순 </h4>
  	<h4>[결정] 사장 세종   </h4>
   
  </li>
  <li class="list-group-item justify-content-between align-items-center">
    <h3>OO 프로젝트 결재 라인</h3>
  	<h4>[결정] 사원 국찬호 </h4>
  	<h4>[검토] 팀장 이다은 </h4>
  	<h4>[결정] 이사 안효인  </h4>
   
  </li>
</ul>

</body>
</html>