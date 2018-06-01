<%@page import="vo.Employee" %>
<%@page import="vo.MydpLine" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.im * {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
.wrap {
min-height: 100%;
position: relative;
padding-bottom: 19px; /* footer height */
}
</style>
<script>
$(function(){
	//var nameObj = $('#searchDiv > input');
	$('#searchBtn').click(function(){
		//String nameValue = $nameObj.val();
		$.ajax({
			data: {'name':$('#searchDiv > input').val()},
			method:'GET',
			url: 'dpsearch.do',
			success: function(data){
				$('#searchResult').empty();
				$('#searchResult').html(data);
			}
		});
	});
});
function fnGetEmp(sParam){
	$.ajax({
		data: {'mydpline_no':$('#select option:selected').val()},
		method:'GET',
		url: 'selectdpline.do',
		success: function(data){
			$('#nowdpline').empty();
			$('#nowdpline').html(data);
			
		}
	});
}

</script>
<div style="max-height:88%; text-align: center;" class="im">
	<div style="margin: 5px; border: 1px solid" >
		<div style="margin: 10px; border: 1px solid; padding: 10px;">
			<h4 style="display: inline;">결제선 저장</h4>
			&nbsp;&nbsp;&nbsp;
			<div class="form-group" style="display: inline;">
				<input type="text" class="form-control" placeholder="결재선 이름 저장"
					id="inputDefault" style="width: 25%; display: inline;">
			</div>
			<button type="button" class="btn btn-info">저장</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h4 style="display: inline;">결재선 목록</h4>
			&nbsp;&nbsp;&nbsp;
			<div class="form-group" style="display: inline;">
				<select class="custom-select" style="width: 20%" id="select" onchange="fnGetEmp(this.value)">
					<option selected="">---저장 결재선---</option>
					<%
					List<MydpLine> mydpLineList = (List)request.getAttribute("mydplinelist");
					for(int i=0; i<mydpLineList.size(); i++) {
						MydpLine mydpline = mydpLineList.get(i);
						String mydpline_name = mydpline.getMydpline_name();
						String mydpline_no = mydpline.getMydpline_no(); 
						System.out.println(i + " "+ mydpline_no +". "+mydpline_name );
					%>
					<option value="<%=mydpline_no %>">
					<%=i+1.%><%=mydpline_name%></option>
					<% 
					}
					%>
				</select>
			</div>
		</div>
		<div style="margin:10px; border: 1px solid; width: 40%; display: inline-block; ">
			<div style="margin: 10px; display: inline-block;">직원 선택</div>
			<div class="form-group" style="display: inline; margin: 10px" id="searchDiv">
				<input type="text" class="form-control" placeholder="사용자 검색"
					id="inputDefault" style="width: 40%; display: inline;">
			</div>
			<button type="button" class="btn btn-info" style="margin: 10px;" id="searchBtn">검색</button>
			<div class="list-group" style="margin: 10px; text-align: center;" id="searchResult">
		<%-- 	<%
				 String result = (String)request.getAttribute("result");
				if(result != null){
					%><%=result %>
					<%
					  return;
				}  --%>
				<%
				List<Employee>list = (List)request.getAttribute("list");
				%>
				
				 <% 
				for(int i=0; i<list.size(); i++) {
					Employee emp = list.get(i);
					String no = emp.getEmp_no();
					String name = emp.getName(); 
					System.out.println(no +" "+name );
			%>
			<a href="#" class="list-group-item list-group-item-action"><%=no%><%=name%></a>
			<%
				}
			%>  
			</div>
		</div>
		<div
			style="margin: 10px; border: 1px solid; width: 40%; display: inline-block;">
			<div style="margin: 10px;">
				<div style="display: inline;">현 결재선</div>
				<div style="display: inline-block; float: right;">초기화</div>
			</div>
			<div class="list-group" style="margin: 10px; vertical-align: middle;" id="nowdpline">
				<a href="#" style="height: 30%" class="list-group-item list-group-item-action"></a>
			</div>
		</div>
	</div>
</div>