<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/main2.css'/>" />
<script type="text/javascript"
			src="<c:url value='/resources/js/main2.js'/>"></script>
<style>
	* {
		box-sizing: border-box;
	}
	
	#Accordion_wrap {
		width: 350px;
		margin-right: 150px;
		float: right;
	}
	
	.que:first-child {
		border-top: 1px solid black;
	}
	
	.que {
		position: relative;
		padding: 15px 0;
		cursor: pointer;
		font-size: 15px;
		font-weight: bold;
		border-bottom: 1px solid #dddddd;
	}
	
	.que::before {
		display: inline-block;
		font-size: 15px;
		color: #006633;
		margin-right: 5px;
	}
	
	.que.on>span {
		font-weight: bold;
		color: #006633;
	}
	
	.anw {
		display: none;
		overflow: hidden;
		font-size: 14px;
		background-color: #f4f4f2;
		padding: 10px 0;
	}
	
	.anw::before {
		display: inline-block;
		font-size: 14px;
		font-weight: bold;
		color: #666;
		margin-right: 5px;
	}
</style>

<h1 class="mt-4">캠퍼스맵</h1>
<br>
<div class="col-xl-6"  style="margin-left: 50px; border: 1px solid gray; float: left;">
	<div>
		<div class="wrap">
			<img class="target" src="${pageContext.request.contextPath }/resources/images/campusmap.png"
				style="width: 600px">
		</div>
		<div style="text-align: center">
			<i class="fas fa-map-marker-alt"></i> 서울 강남구 테헤란로 124 (2호선 강남역1번 출구에서 276m)	
		</div><br>
		<div style="background-color:rgb(229,229,229); text-align: center">
			<button type="button" class="btn btn-secondary" onclick="window.open('https://map.kakao.com/?itemId=11567570')">지도보기(카카오맵)</button>
			<button type="button" class="btn btn-secondary" onclick="window.print()">캠퍼스맵 프린트</button>
		</div>
	</div>
</div>
<br>
<div id="Accordion_wrap">

	 <c:if test="${empty buildingList}">
	 	<div class="que">
	      <span>등록된 건물이 없습니다.</span>
	    </div>
	 </c:if>
	 <c:if test="${!empty buildingList}">
	     <c:forEach var="buildingVo" items="${buildingList }">
		     <c:set var="buildingCode" value="${buildingVo.buildingCode }"/>
		     <div class="que" style="padding-left: 20px">
		     	<span>[${buildingCode }]</span>&nbsp;
		     	<span>${buildingVo.buildingName }</span>
		     </div>
			 <div class="anw">
			 <c:if test="${buildingCode == 8}">
			   	<span style="padding-left: 50px; padding-bottom: 10px">
			   		중앙도서관
			   	</span>
			 </c:if>
		     <c:forEach var="deptVo" items="${deptList }" >
			     <c:if test="${deptVo.buildingCode == buildingCode}">
				     	<span style="padding-left: 50px; padding-bottom: 10px">
				     		${deptVo.deptNo}.&nbsp; ${deptVo.deptName }
				     	</span><br>
			     </c:if>
		     </c:forEach>
			 </div>
	     </c:forEach>
     </c:if>
</div>
<script type="text/javascript">

	$(".que").click(function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>
<%@ include file="../../inc/bottom.jsp" %>  