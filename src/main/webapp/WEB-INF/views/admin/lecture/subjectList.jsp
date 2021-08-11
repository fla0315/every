<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('.btnDel').each(function(index, item) {
			$(item).click(function(){
				var result = confirm('삭제하시겠습니까?');
				
				if(!result) {
					return false;
				} 
				
			});
		});
	}); 
</script>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 수강과목 목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">과목번호</th>
						<th style="text-align: center">교과구분</th>
						<th style="text-align: center">과목명</th>
						<th style="text-align: center">과목설명</th>
						<th style="text-align: center">학점</th>
						<th style="text-align: center">수강인원</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" style="text-align: center">조회된 과목 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.subjCode}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.type}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.subjName}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.explanation}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.credit}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.personnel}</td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/lecture/subjectEdit?subjCode=${vo.subjCode }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/lecture/subjectDelete?subjCode=${vo.subjCode }'/>" 
									class="btnDel">
									<button class="btn btn-danger btn-sm" >
										삭제
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
			<br>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/lecture/subjectRegister'/>">
				<button class="btn btn-primary btn-sm">
					과목등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>