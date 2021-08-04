<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<HTML>
<head>
<title>강의계획서 업로드</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">    

</script>
</head>
<BODY>
 <div class="card-header">
	<i class="fas fa-envelope"></i> 강의계획서
</div>
	<div class="card-body">
		<form name="frmWrite" method="post" enctype="multipart/form-data" action="<c:url value='/professor/lecture/uploadSyllabus'/>">
			<input type="hidden" name="openSubCode" value="${param.openSubCode }">
	         		<div class="col-xs-6">
	                      <label for="theoryTime">이론시간</label>
	                      <input style="width:400px" class="form-control" name="theoryTime" type="text" value=""/>
	              </div>
	              <div class="col-xs-6"><br>
	                      <label for="trainingTime">실습시간</label>
	                      <input style="width:400px" class="form-control" name="trainingTime" type="text" value=""/>
	              </div>
	    	<div>
	    	</div>
			<br>
	        <label for="upfile">첨부파일</label>
	       		<input type="file" id="upfile" name="upfile" />
	   		<span>(최대 2M)</span>
	    <input type="submit" class="btn btn-primary" value="등록"/>
	    </form>
	</div>
</BODY>
</HTML>
 