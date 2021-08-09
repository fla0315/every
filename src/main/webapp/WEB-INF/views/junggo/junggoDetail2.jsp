<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">	
	#info, #desc{
		width:900px;		
	}	
	#viewImg{
		float:left;
		padding:10px 30px 30px 30px;
		width:50%;				
	}
	#viewPd{
		float:left;
		padding:0 10px 30px 20px;
		width: 45%;		
	}
	#desc{
		clear:both;
		padding:10px 0 5px 0;		
	}
	#viewBest{
		float:left;
		padding:0 5px 30px 20px;	
		width:20%;		
	}
	
	.line2{
		border-bottom:solid silver 2px;
		padding:0 0 10px 7px;
	}
	.line
	{
		border-bottom:solid 1px silver;
	}
	.boldF{
		font-size:1.2em;
		font-weight:bold;

	}
	.center{
		text-align:center;
	}
	span{
		font-size:0.9em;
	}
	.sp1{
		width:50%;
		float:left;		
	}
	
	form{
		width:350px;
	}
	
		
	p{
		padding:8px;
		font-size:1.0em;
	}
	
	input[type="text"]{
		width:20%;
	}
</style>

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
<div class="container col-lg-10" role="main"  id="info">
		<h2>상품 상세 페이지</h2>

	<div class="card mb-3" >
			<div class="card-header" >
				<i class="fas fa-table me-1"></i> 상품설명
			</div>
			<div class="card-body">
			<!-- 상품 이미지 넣는 곳 -->
			<div id="viewImg">
				<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<img  src="<c:url value='/resources/images/campusmap.png'/>"	border="0" width="150">
				</a>
			</div>
			
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">상품이미지 크게 보기</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      
				      <!-- 이미지 넣는 부분 -->
				      <div class="modal-body"  style="width: 100%">
				       	<img   style="width: 100%" src="<c:url value='/resources/images/campusmap.png'/>" border="0" width="150">
				      </div>
				      
				      
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div><!-- 모달디브  -->
			
			
		<!-- 상품 설명 -->
		<div id="viewPd">
			<form name="frmPd" method="post" >			
				<!-- 상품명 -->
				<p class="line2">
					<span class="boldF">
						${vo.productName }
					</span>
				</p>
				<p class="line"><span class="sp1">
				<img src="<c:url value='/resources/images/dot2.JPG'/>"> 판매가격</span>				
					<span><fmt:formatNumber value="${vo.sellPrice}" pattern="#,###"/>  </span>
				</p>
				<p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 적립금</span>
					<span><fmt:formatNumber value="${vo.mileage}" pattern="#,###" /> </span>
				</p>
				<p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 제조사</span>
					<span>${vo.company}</span>
				</p>
			
				<p class="line">
					<label for="qty" class="sp1">
					<img src="<c:url value='/resources/images/dot2.JPG'/>"> 구매수량
					</label>
					<input type="text" name="quantity" id="qty" value="1" >
					<input type="text" name="productNo" value="${vo.productNo}" >
					
				</p>
				<p class="center">
					<input type="button" value="바로구매" class="buttons" 
						id="btOrder">
					<input type="button" value="쪽지보내기" class="buttons" 
						id="btCart">
				</p>
			</form>
		</div>
		
	
	
	
		</div> <!-- 메인 디브 -->

</div>



</body>
</html>
<%@ include file="../inc/bottom.jsp"%>