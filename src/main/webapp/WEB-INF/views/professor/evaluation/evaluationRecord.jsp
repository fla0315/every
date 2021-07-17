<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script>
/* 	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/board/getBoardList";
	}); */
	
	$(function(){	//개설과목 학생성적조회
		$('#btCheck').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/evaluation/checkOpenSubj?openSubCode="+openSubCode+"'/>";
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
			<h2>성적 입력/수정</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<br>
				<div class="mb-3">
					<label for="title">개설교과목</label>
					<select id="openSub">
						<option>선택하세요</option>
						<c:if test="${!empty osList }">
							<c:forEach var="vo" items="${osList}">
								<option>${vo.openSubCode }</option>
							</c:forEach>
						</c:if>
						<!-- 개설교과목 번호/이름 교수님 번호로 조회해 for문 돌리기 -->
					</select>
					<input type="button" id="btCheck" value="조회">
				</div>
				<div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-table me-1"></i>
                       성적 입력 테이블
                   </div>
                   <div class="card-body">
                       <table id="datatablesSimple">
                           <thead>
                               <tr>
                               	<th><input type="checkbox"></th>
                               	<th>NO.</th>
                                <th>이름</th>
                                <th>학년</th>
                                <th>학번</th>
                                <th>학과</th>
                                <th>출석</th>
                                <th>과제</th>
                                <th>중간고사</th>
                                <th>기말고사</th>
                                <th>총점</th>
                                <th>최종성적</th>
                               </tr>
                           </thead>
                           <tbody>
                               <c:if test="${empty evList }">
                               	<tr>
                               		<td colspan="12" class="text-center">등록된 학생이 없습니다.</td>
                               	</tr>
                               </c:if>
                               <c:if test="${!empty evList }">
                              	 <c:set var="no" value="1" />
                               	<c:forEach var="map" items="${evList }">
                               		<tr>
                               			<td><input type="checkbox"></td>
                               			<td>${no }</td>
                               			<td>${map['NAME'] }</td>
                               			<td>${map['YEAR'] }</td>
                               			<td>${map['STU_NO'] }</td>
                               			<td>${map['MAJOR'] }</td>
                               			<td><input type="text" value="${map['ATTENDANCE'] }" size="5"></td> <!-- 점수 계산 예정 -->
                               			<td><input type="text" value="${map['ASSIGNMENT'] }" size="5"></td> <!-- 과제 계산 예정 -->
                               			<td><input type="text" value="${map['MIDTERM'] }" size="5"></td>
                               			<td><input type="text" value="${map['FINALS'] }" size="5"></td>
                               			<td><input type="text" value="${map['TOTAL_GRADE'] }" size="5"></td>
                               			<td>
                               				<c:if test="${!empty map['TOTAL_GRADE']}">
                               					<fmt:parseNumber var="grade" type="number" value="${map['TOTAL_GRADE'] }" integerOnly="true"/>
                               					<c:choose>
                               						<c:when test="${grade>=90 }">
                               							A
                               						</c:when>
                               						<c:when test="${grade>=80 }">
                               							B
                               						</c:when>
                               						<c:when test="${grade>=70 }">
                               							C
                               						</c:when>
                               						<c:when test="${grade>=60 }">
                               							D
                               						</c:when>
                               						<c:when test="${grade<60 }">
                               							F
                               						</c:when>
                               					</c:choose>
                               				</c:if>
                               			</td>
                               		</tr>
                               		<c:set var="no" value="${no }+1" />
                               	</c:forEach>
                               </c:if>
                           </tbody>
                       </table>
                   </div>
               </div>
			</form>
			
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">제출</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>

		</div>

	</article>


<%@ include file="../../inc/bottom.jsp" %>