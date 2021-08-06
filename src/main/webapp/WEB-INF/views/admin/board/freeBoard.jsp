<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@ include file="../../inc/admin_top.jsp" %>


<style>

</style>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<script type="text/javascript">
$(function() {
	
	  
	   if($('#confirm').val()==""){
	      $('#writecalom').hide();
	         
	   }
	   

	
$('#comment').keyup(function (e){
    var content = $(this).val();       
    if(content.length > 100) {
    $(this).val($(this).val().substring(0, 100));
    alert("입력은 100자까지만 가능합니다.");
	event.preventDefault();
    }
    });
    
$('#showrite').click(function(){
	$('#confirm').val("Y");
	 $('#writecalom').show();
	
});    
});

</script>

	<div class="card-header" style="font-size: 1.5em">
		
			<i class="fas fa-clipboard-list"></i>&nbsp;자유게시판
		</div>

				
				<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">작성일</th>
						<th style="text-align: center">조회수</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
			
			</table>
			
		
	
		<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-body">
		<a href="<c:url value='/board/write'/>">
				<button class="btn btn-primary btn-sm">
				글 등록
				</button>
				</a>
		</div>
			<br>

			<br>
			
			
			<table id="datatablesSimple">
			
				<colgroup>
					  <col style="width:5%;" />
					  <col style="width:40%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
					  <col style="width:5%;" />
					  <col style="width:5%;" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">작성일</th>
						<th style="text-align: center">조회수</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center;">2</td>
						<td style="vertical-align: middle"><a href="#">광고성 게시글*광고성 게시글*광고성 게시글</a></td>
						<td style="vertical-align: middle; text-align: center;">양길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/05/29</td>
						<td style="vertical-align: middle; text-align: center;">36</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">컴공 자바기초강의 수업 어떤가요??</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/03/14</td>
						<td style="vertical-align: middle; text-align: center;">10</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					
				</tbody>
			</table>
			<input type="hidden" id="confirm">
		</div>


<%@ include file="../../inc/bottom.jsp" %>