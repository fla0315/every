<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">	
	
		
		$(function(){
			$('#btTuition').click(function(){
				open('http://localhost:9091/every/tuition/tuitionPDF','chk',
				 'width=1000,height=1000,left=0,top=0,location=yes,resizable=yes');	
			});
		});
		
		
	
</script>

<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">등록금 조회</h4>
	<br>

	<div class="card mb-4">
		<div class="card-body">
			<table border="0" cellpadding="0" cellspacing="0"
				style="width: 80%; margin: 0 auto;">

				<tr>
					<td><span class=""><label for="학기">학번</label></span></td>
					<td><input type="text" style="width: 50%;" value="${map['STU_NO']}" readonly/></td>

					<td><span class=""><label for="학기">이름</label></span></td>
					<td><input type="text" style="width: 50%"  value="${map['NAME']}" readonly></td>

					<td><span class=""><label for="아이디">아이디</label></span></td>
					<td><input type="text" style="width: 50%"  value="${map['STUDENT_ID']}" readonly></td>

				</tr>
				
				<tr>
					<td><span> &nbsp;</span></td>
				</tr>
				<tr style="margin-top: 20">
					<td><span class=""><label for="학기">학부(과)</label></span></td>
					<td><input type="text" style="width: 50%"  value="${map['DEPT_NAME'] }" readonly></td>

					<td><span class=""><label for="학기">전공</label></span></td>
					<td><input type="text" id="major" style="width: 50%" value="${map['MAJOR']}" readonly></td>
					<td><span class=""><label for="학기"> </label></span></td>
					<td>
						<button>조회</button>
						<button>출력</button>

					</td>
					<!-- 등록금번호 학번 학기 금액, 납부여부, 납부일   -->
				</tr>
			</table>
		</div>
	</div>

	<hr><br>

	<div class="container">
		<table class="box2">
			<caption>등록금 조회</caption>
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">학기</th>
					<th scope="col">학번</th>
					<th scope="col">금액</th>
					<th scope="col">납입구분</th>
					<th scope="col">납부일자</th>
					<th scope="col">출력</th>
				</tr>
			</thead>
			<tbody>
				
			
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" class="align_center">조회된 등록금이 없습니다.</td>
					</tr>
				</c:if>
				
				
				
				
				<c:if test="${!empty list }">
					<c:forEach var="map" items="${list }">
						<tr class="align_center">
							<td>${map['TUITION_NO'] }</td>  <!-- 번호  -->
							<td>${map['SEMESTER'] }</td>  <!-- 학기  -->
							<td>${map['STU_NO'] }</td> <!-- 학번 -->
							<td>
								<fmt:formatNumber value="${map['TUITION'] }" pattern="#,###"/>원 <!-- 금액 -->
							</td>
							<td>${map['DEPOSIT_STATE']}</td> <!-- 납입구분 -->
							
							<td>
								<fmt:formatDate value="${map['DEPOSIT_DATE']}" pattern="yyyy-MM-dd"/> <!-- 납입 날짜 -->
							</td>
							<td><input type="button" id="btTuition" value="출력"></td>
						</tr>
					</c:forEach>
				</c:if>
				
				
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>        
				