<%@page import="vo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:forEach items="${requestScope.list}" var="item" varStatus="status">
<p>${item.name}</p> 
</c:forEach>
