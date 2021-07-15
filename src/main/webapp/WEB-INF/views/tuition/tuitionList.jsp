<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

 <div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">등록금 조회</h4>
	<br>
	
	        <div class="card mb-4">
            <div class="card-body">
	   <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td class="">
							<table border="0" cellpadding="0" cellspacing="0" style="width:70%;">

							<tr>

								<td><span class=""><label for="학기">학번</label></span></td>
								<td>
									<input type="text" style="width: 50%;">
								</td>

								<td><span class=""><label for="학기" >이름</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>
								
								<td><span class=""><label for="학기">학년</label></span></td>
								<td>
								<input type="text" style="width: 50%">
								</td>
								
							</tr>
								
							<tr>
								<td><span class=""><label for="학기">학부(과)</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>

								<td><span class=""><label for="학기">전공</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>
								<td><span class=""><label for="학기"> </label></span></td>
								<td>
                                        <button>조회</button>
                                        <button>출력</button>
                                        
                                 </td>
						
								
                                    
							</tr>

						</table>
	    </div>
	
	    </div>
	
	<hr> <br>
	
	
<div class="container">
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col" width="80">번호</th>
      <th scope="col"  width="100">신청년도</th>
      <th scope="col" width="100">학기</th>
      <th scope="col" width="100">학생구분</th>
      <th scope="col" width="200">납부일자</th>
      <th scope="col"width="200">납입구분</th>
      <th scope="col" width="150">이름</th>
      <th scope="col" width="100">금액</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>2012</td>
      <td>1학기</td>
      <td>김영림</td>
      <td>국가장학금</td>
      <td>지급완료</td>
    </tr>
 <tr>
      <th scope="row">2</th>
      <td>2012</td>
      <td>1학기</td>
      <td>김영림</td>
      <td>국가장학금</td>
      <td>지급완료</td>
    </tr> <tr>
      <th scope="row">3</th>
      <td>2012</td>
      <td>1학기</td>
      <td>김영림</td>
      <td>국가장학금</td>
      <td>지급완료</td>
    </tr>
  </tbody>
</table>	
	</div>			
		</div>		
<%@ include file="../inc/bottom.jsp" %>        
				