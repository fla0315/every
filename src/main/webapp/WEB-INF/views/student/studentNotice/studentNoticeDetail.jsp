<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/student_top.jsp" %>


<div class="container col-lg-10" role="main">
<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 공지사항
		</div>
		<!-- 공지사항 바디부분 -->
		<div class="card-body">
		<c:if test="${!empty NList }">
		<c:forEach var="map" items="${NList }">
			<div>공지사항명 ${map['TITLE'] }</div>		
		</c:forEach>
			<div>제목</div>		
			<div>조회수</div>		
			<div>본문 ${contents}</div>		
			<div><button>닫기</button></div>		
		</c:if>
		</div>
	</div>
	</div>

    
<%@ include file="../../inc/bottom.jsp" %>