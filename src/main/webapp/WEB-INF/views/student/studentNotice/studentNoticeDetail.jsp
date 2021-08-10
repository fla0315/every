<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/student_top.jsp" %>

<script type="text/javascript">

$(function(){
	
	$('#list').click(function(){
		history.back();
	});
});


</script>


<br><br><br><br>
<div class="container col-lg-10" role="main">
<div class="card mb-4">

		<div class="card-header">
			<i class="fas fa-table me-1"></i> 공지사항
		</div>
		
		
		<!-- 공지사항 바디부분 -->
		<div class="card-body">
			<div>제목 : ${map['TITLE'] }</div>		 <hr>	
			<div>조회수 : ${map['READ_COUNT'] }</div>	 <hr>		
			<div>본문 : ${contents}</div>		 <hr>	
			<div><button id="list" type="button">목록</button></div>		
		</div>
	</div>
	</div>

    
<%@ include file="../../inc/bottom.jsp" %>