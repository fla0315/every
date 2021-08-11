<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<%
	String no = (String)session.getAttribute("no");
	String usertype = (String)session.getAttribute("usertype");
	%>
	
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<script type="text/javascript">
$(function() {

	
});
</script>


<br>


<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 내 글 목록
			</div>
			<div class="card-body">
				<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 40%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일자</th>
							<th>조회수</th>
							<th>상세</th>
								
							<th>삭제</th>
								
						
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list3 }">
							<tr>
								<td colspan="7" class="text-center">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list3 }">
							<c:forEach var="vo" items="${list3}">
								<input type="hidden" class="usercheck" value="${vo.writerCode}">
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
											
								<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/post/Delete?postNo=${vo.postNo}'/>"> 
									<button class="btn btn-danger btn-sm"  id="delete">
									삭제
									</button>
									</a>
									</td>
							
			
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
					
				</table>
	
							
			</div>
		</div>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
