<%@page import="vo.SimpleEmp" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${requestScope.mydplineEmp}" var="item" varStatus="status">
	<a href="#" class="list-group-item list-group-item-action">
	<select class="custom-select" style="width: 40%" id="selectbox">
	<option value="1">검토</option>
	<option value="2">부재</option>
	<option value="3">결재</option>
	</select>
	<%-- <c:if test="${mydplineEmp.status eq '검토'}">selected</c:if> --%>

	&nbsp;&nbsp;${item.department} ${item.name} ${item.position }
	<div style="float: right;">
	<i class="fas fa-trash-alt" style=" width: 15px; height: auto;"></i>
	</div>
	</a>
</c:forEach>