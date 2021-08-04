<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script type="text/javascript">
	$(function(){	//개설과목
		$('#btnSave').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/notice/noticeWrite?openSubCode="+openSubCode+"'/>";
			} else{
				alert('개설교과목 번호를 선택하세요!');
			}
		});
	});
</script>

<style type="text/css">
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
	<article>
		<div class="container col-lg-10" role="main">
			<h2>공지사항 등록</h2>
			<form name="form" id="form" role="form" method="post" action="">
				<br>
				<div class="mb-3">
					<label for="title">개설교과목</label>
					<select id="openSub" class="dataTable-selector">
						<option>선택하세요</option>
						<c:if test="${!empty osList }">
							<c:forEach var="vo" items="${osList}">
								<c:if test="${open == vo.openSubCode }">
									<option selected>${vo.openSubCode }</option>
								</c:if>
								<c:if test="${open != vo.openSubCode }">
									<option>${vo.openSubCode }</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<div id="summernote"></div>
					<!-- <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea> -->
				</div>
			</form>

			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">제출</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 100
      });
    </script>
<%@ include file="../../inc/bottom.jsp" %>