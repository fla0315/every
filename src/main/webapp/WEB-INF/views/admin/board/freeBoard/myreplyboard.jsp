<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<script type="text/javascript">
$(function() {
		var type='<%=(String)session.getAttribute("usertype")%>';
		alert(usertype);

	$('#inputwrite').click(function(){
    	  //누르면 창이 떠오르는 형태로(추가시에)		
    	  window.open("write", "chk", "width=850, height=500, resizable=no"); 
	});
	
	
});
</script>
	<br>

	
<article>


	
	
	<!-- 여기서 부터 본문 내용 -->

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 댓글 목록
			</div>
			<div class="card-body">
				<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 12%" />
					<col style="width: 13%" />
					<col style="width: 60%" />
					<col style="width: 15%" />

				</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>등록일자</th>
							<th>작성내용</th>
					
					<%String type=(String)session.getAttribute("usertype");%>		
					
						
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list2 }">
							<tr>
								<td colspan="7" class="text-center">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list2 }">
							<c:forEach var="vo" items="${list2}">
								<tr>

									<td style="vertical-align: middle; text-align: center;">${vo.replyNo}</td>
									<td style="vertical-align: middle; text-align: center;">
									<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
									<td style="vertical-align: middle; text-align: center;">${vo.contents}</td>
									
									<td style="vertical-align: middle; text-align: center;">
										<a href="<c:url value='/post/Detail?postNo=${vo.postNo}'/>" 
									class="btnDel">
									<button class="btn btn-info" >
										상세보기
									</button>
								</a>
								
									
			
								</tr>
							</c:forEach>
						</c:if>

								

					</tbody>
					
				</table>

								
			</div>
		</div>

		<!-- 여기까지 -->
		
		
		
	

	
	


</article>


	
