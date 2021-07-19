<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->

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
		<div class="container col-lg-10" role="main">
			<h2>출석부</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<br>
				<div class="mb-3">
					<label for="title">개설교과목</label>
					<select class="dataTable-selector">
						<option>선택하세요</option>
						<!-- 개설교과목 번호/이름 교수님 번호로 조회해 for문 돌리기 -->
					</select>
				</div>
				<div class="card mb-5">
                   <div class="card-header">
                       <i class="fas fa-table me-1"></i>
                       출석 입력
                   </div>
                   <div class="card-body">
                       <table class="table-bordered text-center" style="width:100%; font-size:0.8em">
                           <thead>
                               <tr>
                               	<th><input type="checkbox"></th>
                               	<th>NO.</th>
                                <th>이름</th>
                                <th>학번</th>
                                <th>학과</th>
                                <c:forEach var="i" begin="1" end="12">
                                   	<th>${i}주차 </th>
                                   </c:forEach>
                                <th>과제점수</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                               	<td><input type="checkbox"></td>
                                   <td>1</td>
                                   <td>홍길동</td>
                                   <td>20211111</td>
                                   <td>컴퓨터공학과</td>
                                   <c:forEach var="i" begin="1" end="12">
                                   	<td>
                                   	<select class="custom-select">
                                   		<option></option>
                                   		<option>출석</option>
                                   		<option>지각</option>
                                   		<option>결석</option>
                                   		<option>조퇴</option>
                                   	</select>
                                   </td>
                                   </c:forEach>
                                   <td></td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			</div>

		</div>

	</article>


<%@ include file="../inc/bottom.jsp" %>