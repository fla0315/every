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
			
		$('#openSub').change(function(){
			var openSubCode = $('#openSub option:selected').val();
			$('#openSubCode').val(openSubCode);
			console.log(openSubCode);
		});
		
		$('form[name=noticeFrm]').submit(function() {
			 console.log(openSubCode);
	         $.ajax({
	            type : "POST",
	            url : "<c:url value='/professor/notice/noticeEdit?postNo="+${param.postNo}"'/>",
	            data : {
	            	"openSubCode":openSubCode,
	            	"title":title,
	            	"contents":contents,
	            	"writeCode":writerCode
	            },
	            success : function() {
	               alert('공지사항 수정 성공');
	            },
	            error :  function() {
	               alert('공지사항 수정 실패');
	            }
	         }) 
	      });
		
		$('#btnDelete').click(function(){
			if(!confirm("삭제하시겠습니까?")){
				event.preventDefault();
			}else{
				location.href="<c:url value='/professor/notice/noticeDelete?postNo="+${map.POST_NO}+"&openSubCode="+${map.OPEN_SUB_CODE}+"'/>"
			}
		});
		
		$('#btnList').click(function(){
			location.href="<c:url value='/professor/notice/noticeList?openSubCode="+${map.OPEN_SUB_CODE}+"'/>";
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
			<h2>${map['TITLE'] }</h2>
			<form name="noticeFrm" id="form" role="form" method="post" action="">
				<br>				
				<div class="mb-3">
					<textarea class="form-control" rows="5" name="contents" id="summernote" placeholder="내용을 입력해 주세요" >${contents }</textarea>
					<input type="hidden" name="title" value="${map['TITLE'] }">
					<input type="hidden" name="writerCode" value="${sessionScope.no }">
					<input type="hidden" id="openSubCode" name="openSubCode" value="">
				</div>

			<div >
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			</form>
		</div>
	</article>
	<br>
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        minHeight: 500,
      });
    </script>
    
    
<%@ include file="../../inc/bottom.jsp" %>