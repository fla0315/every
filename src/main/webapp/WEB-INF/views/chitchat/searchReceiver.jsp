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
		$("#keyword").focus();
		$("#btnSearch").click(function() {
			if ($('#keyword').val().length < 1) {
				alert("이름을 입력하세요");
				$('#keyword').focus();
				return false;
			}
		});
	})
	
	function setReceiver(name, code){	//부모창에 이름, 번호 셋팅하기
		$(opener.document).find('#receiver').val(name);
		$(opener.document).find('#code').val(code);
		self.close();
	}
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
	<form name="frm" method="post" action="<c:url value='/chitchat/searchReceiver'/>">
	<div class="col-lg-10">
		<div class="row mb-3 center">
		
			<div class="form-floating" style="margin-right:10px;">
				<input class="form-control" name="keyword" id="keyword" type="text" value="${param.keyword }" />
			</div> 
			<div class="form-floating">
				<input type="button" class="btn btn-secondary btn-block"
					id="btnSearch" value="검색">
			</div>
		
		</div>
       	</div>
       	</form>
       	<!-- 교수 -->
       	<c:if test="${!empty plist }">
       	<div>교수 목록</div>
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
					<th>직책</th>
				</tr>
				<c:forEach var="map" items="${plist }">
					<tr>
						<td><a href="#" 
						onclick="setReceiver('${map['PROF_NAME'] }','${map['PROF_NO'] }')">
						${map['PROF_NAME'] }</a></td>
						<td>${map['DEPT_NAME'] }</td>
						<td>${map['POSITION_NAME'] }</td>
					</tr>
				</c:forEach>
			</thead>
			<tbody>
	
			</tbody>
			</table>
		</c:if>
		<!-- 학생 -->
		
		<c:if test="${!empty slist }">
		<br><div>학생 목록</div>
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
				<c:forEach var="vo" items="${slist }">
					<tr>
						<td><a href="#" onclick="setReceiver('${vo.name }','${vo.stuNo }')">${vo.name }</a></td>
						<td>${vo.major }</td>
						<td>${vo.stuNo }</td>
					</tr>
				</c:forEach>
			</thead>
			<tbody>
	
			</tbody>
			</table>
		</c:if>
		
		<%-- <c:if test="${!empty alist }">
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
		</c:if> --%>
	</div>
</body>
</html>