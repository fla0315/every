<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${fn:contains(firstNo, 'P')}">
		교수
		<jsp:include page="../inc/prof_top.jsp"></jsp:include>
	</c:when>
	<c:when test="${fn:contains(firstNo, 'E')}">
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		${firstNo }
		<jsp:include page="../inc/student_top.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<body>
	<article>
	<div class="container col-lg-10" role="main">
		<h2>거래 게시판</h2>
		<br>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 거래 등록
			</div>
			<div class="card-body">
				<div class="mb-3">
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
					<input type="text" class="form-control" name="price" id="price" placeholder="가격">
				</div>
				<textarea class="form-control" rows="5" name="contents" id="summernote" placeholder="내용을 입력해 주세요" ></textarea>
			</div>
		</div>
		<div class="card mb-5">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 거래 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<colgroup>
						<col style="width:10%;" />
						<col style="width:30%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />		
						<col style="width:20%;" />		
					</colgroup>
					<thead>
						<tr>
							<th>판매여부</th>
							<th>판매물품</th>
							<th>가격</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>Edinburgh</td>
							<td>Edinburgh</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 200
      });
</script>
<%@ include file="../inc/bottom.jsp"%>
