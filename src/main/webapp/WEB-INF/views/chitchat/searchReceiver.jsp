<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받는 사람 검색</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/> "></script>
<script type="text/javascript">
$(function() {
	$("#name").focus();
	$("#btnSearch").click(function() {
		if ($('#name').val().length < 1) {
			alert("이름을 입력하세요");
			$('#name').focus();
			return false;
		}
	});
})
</script>
<style type="text/css">
	#notice{
		font-size : 0.8em;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>
<div class="card-header">
	<i class="fas fa-envelope"></i> 수신인 검색
</div>
<div class="card-body">
	<p id="notice">쪽지를 받을 사람의 이름을 검색하세요</p>
	<div class="col-lg-10">
		<div class="row mb-3 center">
			<div class="form-floating" style="margin-right:10px;">
				<input class="form-control" name="name" id="name" type="text" value="" />
			</div> 
			<div class="form-floating">
				<input type="button" class="btn btn-secondary btn-block"
					id="btnSearch" value="검색">
			</div>
		</div>
       	</div>
       	
       	<!-- 교수 -->
		<table class="table-bordered text-center" style="width: 100%">
		<colgroup>
			<col style="width: 30%" />
			<col style="width: 30%" />
			<col style="width: 30%" />
		</colgroup>
		<thead>
			<tr>
				<th>이름</th>
				<th>학과</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
		</table>
		
		<!-- 학생 -->
		<table class="table-bordered text-center" style="width: 100%">
		<colgroup>
			<col style="width: 30%" />
			<col style="width: 30%" />
			<col style="width: 30%" />
		</colgroup>
		<thead>
			<tr>
				<th>이름</th>
				<th>학과</th>
				<th>학번</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
		</table>
		
		<!-- 임직원 -->
		<table class="table-bordered text-center" style="width: 100%">
		<colgroup>
			<col style="width: 30%" />
			<col style="width: 30%" />
			<col style="width: 30%" />
		</colgroup>
		<thead>
			<tr>
				<th>이름</th>
				<th>부서</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
		</table>
	</div>
</body>
</html>