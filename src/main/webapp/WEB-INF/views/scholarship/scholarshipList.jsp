<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script
	src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>


<script type="text/javascript">	
	
		
		$(function(){
			$('input[name=btTuition]').click(function(){
				
				open('http://localhost:9091/every/scholarship/scholarshipPDF','chk',
				 'width=1000,height=1000,left=0,top=0,location=yes,resizable=yes');
				
				
			});
		});
		
		
		
		
		$(function(){
			
			$('#selectBt').click(function(){
				event.preventDefault();
				subjList();
			});
		});

		
		
		/* 에이젝스로 받는 거  */
		function subjList(){
			
			//var subjYear=$('#subjYear').val(); //학번
			var semester=$('#semester').val(); //학기
			
			console.log(subjYear);
			console.log(semester);
			
			$.ajax({
				url:"<c:url value='/registration/scholarshipListSearch'/>",
				data:{
					"semester":semester
					//"subjYear":subjYear
				},
				dataType:"json",
				type:"post",
				success:function(res){
					console.log(res)
					var str = "";
					
				/* 	pageMake(res);
					$('#meta_1 em').text(count); */
					
					$("#subjectInfo").empty();
					
					$.each(res, function(idx, item){
						console.log(item)
						str+="<tr class='' role='row' id=''>"; //테이블 여는거 
							str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+년도+"</td>"; //년도
							str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.SEMESTER+"학기"+"</td>"; //학기
							str+="<td role='gridcell' style='height: 0px; width: 7%;'>" +item.NAME+"</td>"; //이름
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.SCHOLARSHIP_TYPE+"</td>"; //장학금 항목
							str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.SCHOLARSHIP+"원"+"</td>";  //지급 금액
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>" +item.ADMISSION_DATE+"</td>"; //수여년도
							str+="<td role='gridcell' style='height: 0px; width: 9%;'><button type='button' class='applyBt'>출력</button></td>"; //장바구니
							/* str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+
							"<a href='<c:url value='/registration/download?fileName="+fileName+"&originalFileName="+originalFileName+"'/>'>"+
							originalFileName+"</a></td>"; */
						str+="</tr>"; //테이블 닫는거
					});
	 				
					$('#subjectInfo ').append(str); //조회누르면 뿌려주는 바디부분

					//$('#meta_1').find('em').text(res.count); //총 조회건수

				}, //석세스 끝나는 부분
				error: function(err) {
					console.log(err)
				}
			});
		}

		/* str+="<td role='gridcell' style='height: 0px; width: 7%;'><button type='button' class='applyBt'>신청</button></td>"; //장바구니
		str+="<td role='gridcell' style='height: 0px; width: 7%;'><form name='frmCart' method='post' action='<c:url value='/registration/open_registrationCart'/>'><input type='hidden' name='openSubCode' value='"+item.OPEN_SUB_CODE+"'> <input type='submit' id='btCart' value='장바구니' class='buttons'> </form> </td>"; //장바구니
	 */
		/*
		
		<td>
			<form name="frmCart" method="post"
				action="<c:url value='/registration/open_registrationCart'/>">
				<input type="hidden" name="openSubCode"
					value="${map['OPEN_SUB_CODE'] }"> <input
					type="submit" id="btCart" value="장바구니" class="buttons">
			</form>
		</td>

		*/



	
</script>



<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">장학금 조회</h4>
	<br>



	<div class="card mb-4">
		<div class="card-body">

			<!-- ---------------------------------------------------------------------------------------------------------------------------  -->
			<table border="0" cellpadding="0" cellspacing="0" style="width: 70%;">
				<tr>
<!-- 
					<td><span class=""><label for="년도">년도</label></span></td>
					<td>
						<div id="">
							<select id="subjYear" name="subjYear">
								<option value='0'>All</option>
								<option value='2021'>2021</option>
								<option value='2020'>2020</option>
								<option value='2019'>2019</option>
								<option value='2018'>2018</option>
								<option value='2017'>2017</option>
								<option value='2016'>2016</option>
							</select>

						</div>
					</td>

					<td style="padding-left: 10px"><span class=""><label
							for="학기">학기</label></span></td>
					<td><select id="semester" name="semester" title="학기" class="">
							<option value="0">All</option>
							<option value="1">1학기</option>
							<option value="2">2학기</option>
					</select></td>


					<td>
						<button id="selectBt">조회</button>
					</td>
 -->
				</tr>

				<tr>

					<td><span class=""><label for="학기">학번</label></span></td>
					<td><input type="text" style="width: 50%;"
						value="${map['STU_NO']}" readonly /></td>


					<td><span class=""><label for="학기">이름</label></span></td>
					<td><input type="text" style="width: 50%"
						value="${map['NAME']}" readonly></td>


				</tr>

				<tr>
					<td><span class=""><label for="학기">학부(과)</label></span></td>
					<td><input type="text" style="width: 50%"
						value="${map['DEPT_NAME'] }" readonly></td>

					<td><span class=""><label for="학기">전공</label></span></td>
					<td><input type="text" id="major" style="width: 50%"
						value="${map['MAJOR']}" readonly></td>

				</tr>

			</table>

			<hr>
			<br>
		</div>
	</div>
	<!-- ---------------------------------------------------------------------------------------------------------------------------  -->

	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-bordered table-striped mb-0" id="showTable">
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
			<tbody id="subjectInfo">

				<c:if test="${empty list }">
					<tr>
						<td colspan="6" class="align_center">조회된 장학금이 없습니다.</td>
					</tr>
				</c:if>


				<c:if test="${!empty list }">
					<c:forEach var="map" items="${list }">
						<tr class="align_center">
							<td>${map['STU_NO']}</td>
							<!-- 번호  -->
							<td>${map['SEMESTER']}</td>
							<!-- 학기  -->
							<td>${map['NAME']}</td>
							<!-- 이름 -->
							<td>${map['SCHOLARSHIP_TYPE'] }</td>
							<!-- 이름 -->
							<td><fmt:formatNumber value="${map['SCHOLARSHIP'] }"
									pattern="#,###" />원 <!-- 금액 --></td>
							<td><fmt:formatDate value="${map['AWARDING_DATE']}"
									pattern="yyyy-MM-dd" /> <!-- 납입 날짜 --></td>
							<td><input type="button" name="btTuition" value="출력"></td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>

	</div>
</div>
	<%@ include file="../inc/bottom.jsp"%>