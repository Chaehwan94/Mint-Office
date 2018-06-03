<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form style="padding:3%;padding-top:1%;" id="noticemodForm">
	<div class="form-group">
		<label class="col-form-label">Title</label>
		<input type="text" name="no" id="noticeWModNo" value="${requestScope.result.noti_no}" readonly style="display:none">
		<input type="text" class="form-control" name = "title" value="${requestScope.result.noti_title}" required readonly>
	</div>
	<div class="form-group">
		<label for="exampleTextarea">Contents</label>
		<textarea class="form-control" name="contents" rows="14" required readonly>${requestScope.result.noti_contents}</textarea>
	</div>
	<div class="form-group"style="margin-top:5px;">
	    <p class="text-muted">Last modified : ${requestScope.result.noti_date}</p>
	    <input type="submit" class="btn btn-outline-info" value="Modify" id="noticeWModBtnIn" style="line-height:14px; display:none;">
	    <input type="button" class="btn btn-outline-warning" value="Modify"  id="noticeWModBtn" style="line-height:14px;">
	    <input type="button" class="btn btn-outline-danger" value="Delete"  id="noticeWDelBtn" style="line-height:14px;">
	    <input type="button" class="btn btn-outline-secondary" value="Cancel" id="noticeWCanBtn"  style="line-height:14px;">
	</div>
</form>