<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${fn:contains(firstNo, 'P')}">
		교수
		<jsp:include page="../inc/prof_top.jsp"></jsp:include>
	</c:when>
	<c:when test="${fn:contains(firstNo, 'E')}">
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		${firstNo }
		<jsp:include page="../inc/student_top.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<body>
	<article>
	<div class="container col-lg-10" role="main">
		<h2>거래 상세 게시판</h2>
		<br>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 상세
			</div>
			<div class="card-body">
				<div id="info">
	<div id="viewImg">
		<!-- 상품 이미지 -->
		<p class="center">
		<a class="link">
			<img src="<c:url value='/pd_images/${vo.imageUrl}'/>"
		 		border="0" width="150">
		</a>	
		</p>
		<p class="center">
		<a class="link">
		 	큰이미지 보기</a></p>
	</div> 
	<!-- 상품이름  -->
	<!-- 상품가격  -->
	<!-- 판매자이름 -->
	<!-- 등록일  -->
	<!-- 만약 판매가 되었을경우 판매상품 취소줄 및 색변경 + 구매버튼 안보이기 -->
	<div id="viewPd">
		<form name="frmPd" method="post" >			
			<!-- 상품명 -->
			<p class="line2">
				<span class="boldF">
				
				</span>
			</p>
			<p class="line"><span class="sp1">
			</p>
			<p class="line"><span class="sp1"> 적립금</span>
			</p>
			<p class="line"><span class="sp1"> 제조사</span>
			</p>
		
			<p class="line">
				<input type="button" value="구매" class="buttons" id="btOrder">
				<input type="button" value="목록" class="buttons" id="btOrder">
			</p>
		</form>
	</div>
			</div>
		</div>
	</div>
	
	
</article>
<%@ include file="../inc/bottom.jsp"%>
</body>
</html>