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
			<i class="fas fa-user-alt"></i>&nbsp; 학생목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">학번</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">입학년도</th>
						<th style="text-align: center">졸업년도</th>
						<th style="text-align: center">이수학기</th>
						<th style="text-align: center">학적상태</th>
						<th style="text-align: center">수정</th>
						<!-- <th style="text-align: center">삭제</th> -->
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" style="text-align: center">등록된 학생정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
						<c:set var="admissionDate" value="${vo.admissionDate}"/>
						<c:set var="graduationDate" value="${vo.graduationDate}"/>
						<c:set var="semester" value="${vo.semester}"/>
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.major }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.stuNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.name }</td>
			               <td style="vertical-align: middle; text-align: center;">
			               	${fn:substring(admissionDate,0,4) }
			               </td>
			               <c:if test="${graduationDate == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${graduationDate != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${fn:substring(graduationDate,0,4) }
					            </td>
			               </c:if>
			               <c:if test="${semester == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${semester != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${semester}
					            </td>
			               </c:if>
			               <td style="vertical-align: middle; text-align: center;">${vo.stateName }</td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/student/studentEdit?stuNo=${vo.stuNo }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/student/studentRegister'/>">
				<button class="btn btn-primary btn-sm">
					학생등록
				</button>
				</a>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>