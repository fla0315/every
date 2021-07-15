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
                        
                            <!-- ********************** 검색조건 테이블 시작 ********************** -->
                            <table border="0" cellspacing="5">
                                <tr>
  									<td style="padding-left:3px"><span class=""><label for="학기">학번</label></span></td>
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

							</tr>

						</table>
	    </div>
	
	    </div>
	
	<hr> <br>
	
	
<div class="container">
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">신청년도</th>
      <th scope="col">학기</th>
      <th scope="col">이름</th>
      <th scope="col">금액</th>
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
      <th scope="row">1</th>
      <td>2012</td>
      <td>1학기</td>
      <td>김영림</td>
      <td>국가장학금</td>
      <td>지급완료</td>
    </tr> <tr>
      <th scope="row">1</th>
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
				