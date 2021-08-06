<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/custom_top.jsp"%>
<!-- summernote -->
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
.writetext {
	overflow: hidden;
	background: #EFE5DC;
	padding: 5px 10px 16px 10px;
	border-radius: 10px;
	height:50px;
	width:100px;
}


</style>
	<article>
		<div class="container" role="main">
			<h2>글쓰기</h2>
			<form name="formre" id="formre" role="form" method="post">
				<br>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" style="width:300px;">
				</div>
				
				<div class="mb-3" style="width:800px;">
					<label for="content">내용</label>
					
					<div id="summernote" class="summernote"></div>
				
					
					<!-- <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea> -->
				</div>
			
				<div class="writetext" style="height:30px;">
				
				
				&nbsp; 익명 <input type="checkbox" class="isprivate" name="isprivate" value="Y" style="border:1px solid black;" > 
							<!-- 미선택시 이름 등록 -->
							<input type="hidden" class="name" name="isprivate" value={param.name}>
				
			</div>
			<br>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnname">시험</button>
				<input type="submit" class="inputcon" id="inputcon" value="제출">
			</div>
			<input type="text" id="test1" class="test1" style="height:50px">
			</form>
		</div>
		
	</article>
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 100
        
      });
    </script>
    
  <script type="text/javascript">
$(function() {
	$('#btnname').click(function(){
		  $('.test1').val($('.summernote').summernote('code').replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""));
		  alert(content);
	    });
	
	$("#summernote").on("summernote.enter", function(we, e) {
	     $(this).summernote("pasteHTML", "<br><br>");
	     e.preventDefault();
	});
	
	$('form[name=formre]').submit(function(){	
		 var content = $('.summernote').summernote('code').replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
		$.ajax({
		          type: "post",
		          url: '<c:url value='/board/insert'/>',
		          data: "content="+content,  
		          async: false,
		          success: function(){    	
		        	  alert("등록성공");
		        		
		           }, error: function (xhr, status, error){
						alert("error 발생!!" + error);
					}
			   });

	});
	
});
</script>
    
    
<%@ include file="../../inc/bottomforcustom.jsp"%>