<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>


<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
	$(function(){
		
		$('#search').click(function(){
			var sum =0;
			var count=0;
			$('tr #credit').each(function(idx,item){
				sum += Number($(this).text());
			});
			$('input[name=sumCredit]').val(sum);
			
			
			$('tr #credit').each(function(idx,item){
				count+=1;
			});
			$('input[name=sumCount]').val(count);
			
		});	
	}); 
	
	

	$('#selectBt').click(function(){
		event.preventDefault();
		subjList();
	});
});



/* 에이젝스로 받는 거  */
function subjList(){
	var subjYear=$('#subjYear').val(); //년도
	var semester=$('#semester').val(); //학기
	
	console.log(subjYear);
	console.log(semester);
	
	
	$.ajax({
		url:"<c:url value='/registration/myregistration'/>",
		data:{
			"semester":semester,
			"subjYear":subjYear
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
				str+="<td role='gridcell' style='height: 0px; width: 7%;'><form name='frmRegistration' method='post' action='<c:url value='/registration/request_registrationInsert'/>'><input type='hidden' name='openSubCode' value='"+item.OPEN_SUB_CODE+"'> <input type='submit' value='수강신청' class='buttons'> </form> </td>"; //장바구니
					str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.SEMESTER+"학기"+"</td>"; //학기
					str+="<td role='gridcell' style='height: 0px; width: 7%;'>" +item.SUBJ_NAME+"</td>"; //과목명
					str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.FACULTY_NAME+"</td>"; //학부(과)
					str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.GRADE+"학년"+"</td>";  //학년
					str+="<td role='gridcell' style='height: 0px; width: 9%;'>" +item.TYPE+"</td>"; //이수구분
					str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.CREDIT+"학점"+"</td>"; //학점
					str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+"/"+item.PERSONNEL+"</td>"; //담당교수
					str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.PROF_NAME+"</td>"; //담당교수
					str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.TIMETABLE+"</td>"; //담당교수
					str+="<td role='gridcell' style='height: 0px; width: 9%;'><button type='button' class='applyBt'>강의계획서</button></td>"; //장바구니
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







</script>


   <div class="container-fluid px-4" style="background-color: white;">
        <h4 class="mt-4" style="background-color: white;">수강신청내역조회</h4>
        
        <!-- 개설교과과정 조회 페이지 -->
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
                                            <select id="subjYear" name="subjYear" >
                                            	<option value="0">All</option>
                                                <option value='2021'>2021</option>
                                                <option value='2020'>2020</option>
                                                <option value='2019'>2019</option>
                                                <option value='2018'>2018</option>
                                            </select>
                                         
                                        </div>
                                    </td>

                                    <td style="padding-left:10px"><span class=""><label for="학기">학기</label></span></td>
                                    <td>
                                        <select id="semester" name="semester" title="학기" class="" >
                                            <option value="0">All</option>
                                            <option value="1">1학기</option>
                                            <option value="2">2학기</option>
                                        </select>
                                    </td>

  									<td style="padding-left:10px"><span class=""><label for="학기">학번</label></span></td>
                                    <td>
                                        <input type="text" value="${map['STU_NO']}" readonly>
                                    </td>

									<td style="padding-left:10px"><span class=""><label for="학기">이름</label></span></td>
                                    <td>
                                        <input type="text" value="${map['NAME']}" readonly>
                                    </td>


									<td>
                                        <button  type="button" id="search">조회</button>
                                    </td>
								</tr>
								
                                <!-- 2행완료 -->
                            </table>
                            <hr> <br>
							<label>신청과목</label> <input  name="sumCount" type="text" value=""  readonly="readonly">
							<label>신청학점</label> <input name="sumCredit" type="text" value="" readonly="readonly"><br>

                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-striped mb-0">
                             <thead>
									<tr>
										<th scope="col">년도</th>
										<th scope="col">학기</th>
										<th scope="col">과목명</th>
										<th scope="col">학부(과)</th>
										<th scope="col">학년</th>
										<th scope="col">이수구분</th>
										<th scope="col">학점</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의실/시간</th>
										<th scope="col">강의계획서</th>
									</tr>
								</thead>
                 <tbody>

									<!-- 데이터 없을 때  -->
									<c:if test="${empty list }">
									<c:set var="totalCredit" value="0" />
										<tr>
											<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
										</tr>
									</c:if>

									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
										<c:set var="sum" value="${map['CREDIT']}" />
											<tr class="align_center">

												<!-- 년도 -->
												<td><fmt:formatDate value="${map['OPEN_DATE']}"
														pattern="yyyy" /></td>
												<!-- 학기 -->
												<td>${map['SEMESTER'] }</td>
												<!-- 과목명 -->
												<td>${map['SUBJ_NAME'] }</td>
												<!-- 학부(과)  -->
												<td>${map['FACULTY_NAME'] }</td>
												<!-- 학년 -->
												<!-- 이수구분 -->
												<td>${map['GRADE'] }</td>
												<!-- 이수구분 -->
												<td>${map['TYPE'] }</td>
												<!-- 학점 -->
												<td id="credit">${map['CREDIT'] }</td>
												<!-- 담당교수 -->
												<td>${map['PROF_NAME'] }</td>
												<!-- 강의실/시간 -->
												<td>${map['TIMETABLE'] }</td>
												<!-- 강의계획서 -->
												<td><input type="button" id="btSyllabus" value="강의계획서"></td>

											</tr>
										</c:forEach>
			
									</c:if>
				

								</tbody>
                            </table>
                            </div>






<%@ include file="../inc/bottom.jsp" %>        
