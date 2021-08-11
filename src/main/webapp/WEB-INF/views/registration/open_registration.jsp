<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>


<script type="text/javascript">

	
	$(function(){
		$('#selectBt').click(function(){
			event.preventDefault();
			subjList();
		});
	});

	
	
	/* 에이젝스로 받는 거  */
	function subjList(){
		var openYear=$('#openYear').val(); //년도
		var semester=$('#semester').val(); //학기
		var grade=$('#grade').val(); //학년
		var type=$('#type').val(); //이수구분
		var deptName=$('#deptName').val(); //학과
		var subjName=$('#subjName').val(); //과목명
		
		
		console.log(openYear);
		console.log(semester);
		console.log(grade);
		console.log(type);
		console.log(deptName);
		console.log(subjName);
		
		
		$.ajax({
			url:"<c:url value='/registration/open_registration'/>",
			data:{
				"deptName":deptName, //위에서 만들어준거
				"subjName":subjName,
				"type":type,
				"grade":grade,
				"semester":semester,
				"openYear":openYear,
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
					str+="<td role='gridcell' style='height: 0px; width: 7%;'><form name='frmCart' method='post' action='<c:url value='/registration/open_registrationCart'/>'><input type='hidden' name='openSubCode' value='"+item.OPEN_SUB_CODE+"'> <input type='submit' id='btCart' value='장바구니' class='buttons'> </form> </td>"; //장바구니
						str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.OPEN_YEAR+"</td>"; //년도
						str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.SEMESTER+"학기"+"</td>"; //학기
						str+="<td role='gridcell' style='height: 0px; width: 7%;'>" +item.SUBJ_NAME+"</td>"; //과목명
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.DEPT_NAME+"</td>"; //학부(과)
						str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.GRADE+"학년"+"</td>";  //학년
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>" +item.TYPE+"</td>"; //이수구분
						str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.CREDIT+"학점"+"</td>"; //학점
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.PROF_NAME+"</td>"; //담당교수
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.TIMETABLE+"</td>"; //담당교수
						str+="<td role='gridcell' style='height: 0px; width: 9%;'><form name='frmSyllabus' method='get' action='<c:url value='/registration/download'/>'><input type='hidden' name='openSubCode' value='"+item.OPEN_SUB_CODE+"'><input type='hidden' name='syllabus' value='"+item.SYLLABUS+"'> <input type='submit' id='btSylla' value='강의계획서' class='buttons'> </form> </td>";
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
	<h4 class="mt-4" style="background-color: white;">개설과목조회</h4>


	<div class="card mb-4">
		<div class="card-body">

			<!-- ========================================검색조건 시작====================================================================== -->

			<form name="frmSearch" method="post"
				action='<c:url value="/registration/open_registration"/>'>
				<!-- ********************** 검색조건 테이블 시작 ********************** -->
				<table border="0" cellspacing="5">
					<tr>
						<!-- 년도는 5개로 고정 -->
						<td id="hide1"><span class=""><label for="년도">년도</label></span></td>
						<td>
							<!-- 년도  -->
							<div id="">
								<select name="openYear" id="openYear">
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

						<!-- 학기 -->
						<td style="padding-left: 10px"><span class=""><labelfor="학기">학기</label></span></td>

						<td>
							<select id="semester" name="semester"
								class="ctl_select" tabindex="1" title="학기">
									<option value="0">All</option>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
							</select>
						</td>


						<!-- 학년 -->
						<td style="padding-left: 10px"><span class=""><label
								for="학년">학년</label></span></td>
						<td>
							<select style="vertical-align: middle;"
								id="grade" name="grade" title="학년" class=""
								notnull="true">
									<option value="0">ALL</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select>
						</td>




						<!-- 이수구분 -->
						<td><span class="ctl_label"> <label
								for="searchCptnDcd">이수구분</label></span></td>
						<td><select id="type" name="type"
							class="ctl_select" tabindex="1" title="이수구분">
								<option value="0">ALL</option>
								<c:forEach var="typeMap" items="${typeMap}">
									<option value="${typeMap['TYPE_CODE']}">${typeMap['TYPE']}</option>
								</c:forEach>
						</select></td>
					</tr>
					<!-- 1행 완료 -->
						
						
						
					<!-- 여기는 과목명으로하자 -->
					<!-- 2행 시작 -->
					<tr>
						<td><span class=""><label for="과목명">과목명</label></span></td>
							<td><input type="text" name="subjName" id="subjName" size="20"
							placeholder="과목명을 입력해주세요"></td>

					
						<td style="padding-left: 10px"><span class=""><label
								for="학부">학과/학부</label></span></td>
						<td id="major_1">
							<select id="deptName" name="deptName"
								class="ctl_select" tabindex="1" title="전공">
									<option value="0">ALL</option>
								<c:forEach var="fMap" items="${facultyMap}">
									<option value="${fMap['FACULTY_NO']}">${fMap['DEPT_NAME']}</option>
								</c:forEach>
							</select>
						</td>


						<td>
							<div class="buttonset" style="float:right">
								<button class="btn-search"  id="selectBt" >조회</button>
							</div>
						</td>

					</tr>
					<!-- 2행완료 -->

				</table>
			</form>
			<!-- ========================================검색조건 끝====================================================================== -->
			<hr>
			<br>
			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-bordered table-striped mb-0" id="showTable">
					<thead>
						<tr>
							<th scope="col">장바구니</th>
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
					<tbody id="subjectInfo">
						<!-- 뿌려주는부븐 -->
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>