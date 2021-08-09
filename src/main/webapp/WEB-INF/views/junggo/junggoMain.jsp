<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
	<c:when test="${fn:contains(firstNo, 'P')}">
		<jsp:include page="../inc/prof_top.jsp"></jsp:include>
	</c:when>
	<c:when test="${fn:contains(firstNo, 'E')}">
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
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

#enroll, .clickDetail{
	color:black;
}

#enroll:hover, .clickDetail:hover{
	color:gray;
}

.red{
	color:red;
}
</style>
<body>
	<article>
	<div class="container col-lg-10" role="main">
		<h2>거래 게시판</h2>
		<br>
			<div class="card mb-3">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab">
					<div class="card-header">
						<a role="button" id="enroll" data-toggle="collapse" data-parent="#accordion"
							href="#collapse1" aria-expanded="false">
									<i class="fas fa-money-bill-alt"></i> 거래 등록
							</a>
							</div>
					</div>
					<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
						<div class="panel-body">
							<div class="card-body">
				<form name="frmWrite" method="post" enctype="multipart/form-data" action="<c:url value='/junggo/junggoMain'/>">
				<div class="mb-3">
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요"><br>
					<input type="text" class="form-control" name="price" id="price" placeholder="가격"><br>
		       		<input class="form-control" type="file" id="upfile" name="upfile" />
		       		<input type="hidden" name="writerCode" value="${sessionScope.no }">
				</div>
				<textarea class="form-control" rows="5" name="contents" id="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				<br>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				</form>
			</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<br>
		<div class="card mb-5">
			<div class="card-header">
				<i class="fas fa-shopping-cart"></i> 거래 목록
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
							<th>제목</th>
							<th>가격</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"></td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="map" items="${list}">
								<tr>
									<td>
										<c:if test="${map['DEL_FLAG'].equals('S') }">
											판매중
											
										</c:if>
										<c:if test="${map['DEL_FLAG'].equals('C') }">
											<span class="red">
											판매완료
											</span>
										</c:if>
									</td>
									<td><a class="clickDetail" href="<c:url value='/junggo/junggoDetail?postNo=${map.POST_NO }'/>">${map['TITLE'] }</a></td>
									<td><fmt:formatNumber value="${map['PRICE'] }" pattern="#,###" />원</td>
									<td>${map['WRITER'] }</td>
									<td><fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:if>
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
