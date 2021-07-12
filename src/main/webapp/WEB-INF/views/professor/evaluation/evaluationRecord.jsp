<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/board/getBoardList";
	});
</script>

<style type="text/css">
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
	<article>
		<div class="container" role="main">
			<h2>학생 성적 입력</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<br>
				<div class="mb-3">
					<label for="title">개설교과목</label>
					<select>
						<option>선택하세요</option>
						<!-- 개설교과목 번호/이름 교수님 번호로 조회해 for문 돌리기 -->
					</select>
				</div>
				<div class="mb-3">
					<label for="title">학생번호</label>&nbsp;&nbsp;<input type="button" class="btn_ btn-primary btn-sm bt_address" value="조회">
					<input type="text" class="form-control" name="title" id="title" placeholder="성적을 입력할 학생을 선택해주세요">
				</div>

				<div class="mb-3">
					<label for="reg_id">성적</label>
					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="성적을 입력해 주세요">
				</div>

				

				<div class="mb-3">
					<label for="content">학생 평가</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
			</form>

			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">제출</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>

		</div>

	</article>


<%@ include file="../../inc/bottom.jsp" %>