<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%
	String no = (String)session.getAttribute("no");
	String usertype = (String)session.getAttribute("usertype");
	%>
	
	<%if(usertype.equals("professor")){ %>
	<jsp:include page="../../../inc/prof_top.jsp"></jsp:include>
	<%}else if(usertype.equals("admin")){ %>
		<jsp:include page="../../../inc/admin_top.jsp"></jsp:include>
		<%}else if(usertype.equals("student")){ %>
		<jsp:include page="../../../inc/student_top.jsp"></jsp:include>
		<%} %>


	


<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<script type="text/javascript">
$(function() {
		var type='<%=(String)session.getAttribute("usertype")%>';
	

	$('#inputwrite').click(function(){
    	  //누르면 창이 떠오르는 형태로(추가시에)		
    	  window.open("write", "chk", "width=850, height=500, resizable=no"); 
	});
	
	
});
</script>
	<br>




	<div class="container col-lg-10" role="main">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="mainbox-tab"
					data-bs-toggle="pill" data-bs-target="#mainbox" type="button"
					role="tab" aria-controls="mainbox" aria-selected="true">전체 리스트</button>
			</li>
			
				
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myreplyboard-tab"
					data-bs-toggle="pill" data-bs-target="#myreplyboard" type="button"
					role="tab" aria-controls="myreplyboard" aria-selected="false">나의 댓글함</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myfreeboard-tab"
					data-bs-toggle="pill" data-bs-target="#myfreeboard" type="button"
					role="tab" aria-controls="myfreeboard" aria-selected="false">나의 작성글</button>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="mainbox"
				role="tabpanel" aria-labelledby="mainbox-tab">
	<br>

	
	
	<!-- 여기서 부터 본문 내용 -->

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 전체글 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							
							<th style="vertical-align: middle; text-align: center;">번호</th>
							<th style="vertical-align: middle; text-align: center;">제목</th>
							<th style="vertical-align: middle; text-align: center;">등록일자</th>
							<th style="vertical-align: middle; text-align: center;">조회수</th>
							<th style="vertical-align: middle; text-align: center;">상세</th>
							
								<%String type=(String)session.getAttribute("usertype");%>		
					<%if(type.equals("admin")){ %>			
								<th>삭제</th>
						<%}else{%>	
					<%} %>
						
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="7" class="text-center">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list}">
								<tr>

									<td style="vertical-align: middle; text-align: center;">${vo.postNo}</td>
									<td style="vertical-align: middle; text-align: center;">${vo.title}</td>
									<td style="vertical-align: middle; text-align: center;">
									<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
									<td style="vertical-align: middle; text-align: center;">${vo.readCount}</td>
									<td style="vertical-align: middle; text-align: center;">
										<a href="<c:url value='/post/Detail?postNo=${vo.postNo}'/>" 
									class="btnDel">
									<button class="btn btn-info" >
										상세보기
									</button>
								</a>
									</td>			
										<%if(type.equals("admin")){ %>			
								<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/post/Delete?postNo=${vo.postNo}'/>"> 
									<button class="btn btn-danger btn-sm"  id="delete">
									삭제
									</button>
									</a>
									</td>
						<%}else{%>	
					<%} %>
									
			
								</tr>
							</c:forEach>
						</c:if>

								

					</tbody>
					
				</table>
	<br>
						
									<button class="btn btn-danger btn-sm" id="inputwrite" class="inputwrite" name="inputwrite" style="float:right">
										등록하기
									</button>
									
			</div>
		</div>

		<!-- 여기까지 -->
		
		
		
	
	</div>
	
	

			<div class="tab-pane fade" id="myreplyboard" role="tabpanel"
				aria-labelledby="myreplyboard-tab">
				<c:import url="myreplyboard.jsp"></c:import>	
			</div>
			
			<div class="tab-pane fade" id="myfreeboard" role="tabpanel"
				aria-labelledby="myfreeboard-tab">
				<c:import url="myfreeboard.jsp"></c:import>
			</div>
		
		</div>
</div>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%@ include file="../../../inc/bottom.jsp"%>
	
