<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>


<script type="text/javascript">	
	
		
		$(function(){
			$('#btScholarship').click(function(){
				
				open('http://localhost:9091/every/scholarship/scholarshipPDF','chk',
				 'width=1000,height=1000,left=0,top=0,location=yes,resizable=yes');
				
				
			});
		});
		
		
	
</script>



 <div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">장학금 조회</h4>
	<br>
	
	
	
		        <div class="card mb-4">
            <div class="card-body">
	   <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td class="">
                        
                            <!-- ********************** 검색조건 테이블 시작 ********************** -->
                            <table border="0" cellspacing="5">
                                <tr>
                                    <td><span class=""><label for="년도">년도</label></span></td>
                                    <td>
                                        <div id="">
                                            <select >
                                            	<option value="">- 전체 -</option>
                                                <option value=''>2021</option>
                                                <option value=''>2020</option>
                                                <option value=''>2019</option>
                                                <option value=''>2018</option>
                                            </select>
                                         
                                        </div>
                                    </td>

                                    <td style="padding-left:10px"><span class=""><label for="학기">학기</label></span></td>
                                    <td>
                                        <select id="" name="" title="학기" class="" >
                                            <option value="">- 전체 -</option>
                                            <option value="">1학기</option>
                                            <option value="">2학기</option>
                                        </select>
                                    </td>

  									<td style="padding-left:10px"><span class=""><label for="학기">학번</label></span></td>
                                    <td>
                                        <input type="text" >
                                    </td>

									<td style="padding-left:10px"><span class=""><label for="학기">이름</label></span></td>
                                    <td>
                                        <input type="text" >
                                    </td>


									<td>
                                        <button>조회</button>
                                        <button>출력</button>
                                    </td>
								</tr>
								
                                <!-- 2행완료 -->
                            </table>
							
							<hr>
							
							<table border="0" cellpadding="0" cellspacing="0" style="width:70%;">

							<tr>

								<td><span class=""><label for="학기">학번</label></span></td>
								<td><input type="text" style="width: 50%;" value="${map['STU_NO']}" readonly/></td>


								<td><span class=""><label for="학기" >이름</label></span></td>
								<td><input type="text" style="width: 50%"  value="${map['NAME']}" readonly></td>
								
								
							</tr>
								
							<tr>
								<td><span class=""><label for="학기">학부(과)</label></span></td>
								<td><input type="text" style="width: 50%"  value="${map['DEPT_NAME'] }" readonly></td>

								<td><span class=""><label for="학기">전공</label></span></td>
								<td><input type="text" id="major" style="width: 50%" value="${map['MAJOR']}" readonly></td>

							</tr>

						</table>
	    </div>
	
	    </div>
	
	<hr> <br>
	
	
<div class="container">
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">학번</th>
      <th scope="col">학기</th>
      <th scope="col">이름</th>
      <th scope="col">장학금 항목</th>
      <th scope="col">지급 금액</th>
      <th scope="col">수여년도</th>
      <th scope="col">확인서</th>
    </tr>
  </thead>
  <tbody>
   
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" class="align_center">조회된 장학금이 없습니다.</td>
					</tr>
				</c:if>
				
				
				<c:if test="${!empty list }">
					<c:forEach var="map" items="${list }">
						<tr class="align_center">
							<td>${map['STU_NO'] }</td>  <!-- 번호  -->
							<td>${map['SEMESTER'] }</td>  <!-- 학기  -->
							<td>${map['NAME']}</td> <!-- 이름 -->
							<td>${map['SCHOLARSHIP_TYPE'] }</td> <!-- 이름 -->
							<td>
								<fmt:formatNumber value="${map['SCHOLARSHIP'] }" pattern="#,###"/>원 <!-- 금액 -->
							</td>
							<td>
								<fmt:formatDate value="${map['AWARDING_DATE']}" pattern="yyyy-MM-dd"/> <!-- 납입 날짜 -->
							</td>
							<td><input type="button" id="btScholarship" value="출력"></td>
						</tr>
					</c:forEach>
				</c:if>
				
  </tbody>
</table>	
	</div>			
		</div>		
<%@ include file="../inc/bottom.jsp" %>        
				