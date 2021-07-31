<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>


<script type="text/javascript">

	
	$(function(){
	/* 	subjList(1) */;
		//학부 선택시 해당되는 학과만 나오도록 함
		/* $('#FACULTY_NAME').change(function(){
			var facultyName=$('#FACULTY_NAME option:selected').val();
			$.ajax({
				url:"<c:url value='/registration/open_registration'/>",
				type:"post",
				data:{"facultyName":facultyName},
				success:function(res){
					var str="<select name='major' id='major' style='width: 100%'>";
					str+="<option value='0'>ALL</option>";
	
					$.each(res, function(index, item){
						str+="<option value='"+item.FACULTY_NO+"'>"+item.FACULTY_NAME+"</option>";
					});
						str+="</select>";
						$('#major_1').html(str);
				}
	
			});
		}); */
	
		//조회버튼 누르면 동작하는 부분
		$('#selectBt').click(function(){
			subjList(1);
		});
	});

	
	
	/* 에이젝스로 받는 거  */
	function subjList(){
		var subjYear=$('#subjYear').val(); //년도
		var semester=$('#semester').val(); //학기
		var grade=$('#grade').val(); //학년
		var type=$('#type').val(); //이수구분
		var facultyName=$('#facultyName').val(); //학과
		var subjName=$('#subjName').val(); //과목명
		
		
		console.log(subjYear);
		console.log(semester);
		console.log(grade);
		console.log(type);
		console.log(facultyName);
		console.log(subjName);
		
		
		$.ajax({
			url:"<c:url value='/registration/open_registration1'/>",
			data:{
				"FACULTY_NAME":facultyName, //위에서 만들어준거
				"subjName":subjName,
				"type":type,
				"grade":grade,
				"semester":semester,
				"subjYear":subjYear
			},
			dataType:"json",
			type:"post",
			success:function(res){
				var str = "";
				
			/* 	pageMake(res);
				$('#meta_1 em').text(count); */
				
				$.each(res.list, function(idx, item){
					str+="<tr class='' role='row' id=''>"; //테이블 여는거 
						str+="<td role='gridcell' style='height: 0px; width: 7%;'><button type='button' class='applyBt'>신청</button></td>"; //장바구니
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.subjYear+"</td>"; //년도
						str+="<td role='gridcell' style='height: 0px; width: 18%; text-align: center'>"+item.semester+"</td>"; //학기
						str+="<td role='gridcell' style='height: 0px; width: 7%;'>" +item.subjName+"</td>"; //과목명
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.facultyName+"</td>"; //학부(과)
						str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.grade+"</td>";  //학년
						str+="<td role='gridcell' style='height: 0px; width: 14%;'>" +item.type+"</td>"; //이수구분
						str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.CREDIT+"</td>"; //학점
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>"; //담당교수
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>"; //강의실 / 시간
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>"; //강의 계획서
						/* str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+
						"<a href='<c:url value='/registration/download?fileName="+fileName+"&originalFileName="+originalFileName+"'/>'>"+
						originalFileName+"</a></td>"; */
					str+="</tr>"; //테이블 닫는거
				});
 
				$('#showTable tbody').html(str); //조회누르면 뿌려주는 바디부분

				//$('#meta_1').find('em').text(res.count); //총 조회건수

			} //석세스 끝나는 부분
		});
	}









</script>







<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">개설과목조회</h4>


	<div class="card mb-4">
		<div class="card-body">

			<!-- ========================================검색조건 시작====================================================================== -->

			<form name="frmSearch" method="post"
				action='<c:url value="/registration/open_registration1"/>'>
				<!-- ********************** 검색조건 테이블 시작 ********************** -->
				<table border="0" cellspacing="5">
					<tr>
						<!-- 년도는 5개로 고정 -->
						<td id="hide1"><span class=""><label for="년도">년도</label></span></td>
						<td>
							<!-- 년도  -->
							<div id="">
								<select name="subjYear" id="subjYear">
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
								class="ctl_select" tabindex="1" title="이수구분">
									<option value="10">1학기</option>
									<option value="20">2학기</option>
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
								<option value="">ALL</option>
								<c:forEach var="typeMap" items="${typeMap }">
									<option value="${typeMap['TYPE_CODE']}">${typeMap['TYPE'] }</option>
								</c:forEach>
						</select></td>
					</tr>
					<!-- 1행 완료 -->
						
						
						
					<!-- 여기는 과목명으로하자 -->
					<!-- 2행 시작 -->
					<tr>
						<td><span class=""><label for="과목명">과목명</label></span></td>
							<td><input type="text" name="subjName" id="subjName" size="15"
							placeholder="검색어 (Search Word)"></td>

					
						<td style="padding-left: 10px"><span class=""><label
								for="전공">전공</label></span></td>
						<td id="major_1">
							<select id="facultyName" name="facultyName"
								class="ctl_select" tabindex="1" title="전공">
									<option value="0">ALL</option>
								<c:forEach var="fMap" items="${facultyMap }">
									<option value="${fMap['FACULTY_NO']}">${fMap['FACULTY_NAME'] }</option>
								</c:forEach>
							</select>
						</td>


						<td style="padding-left: 10px"><span class="ctl_label">
								<label for="searchSbNo">교과목번호/명</label>
						</span></td>

						<td><input type="text" id="searchSbNo" name="searchSbNo"
							value="" class="ctl_input" title="교과목번호/명" style="width: 60px"
							size="30" tabindex="1" />
							<button>
								<i class="fas fa-search"></i>
							</button> <input type="text" id="searchNm" name="searchNm" value=""
							class="ctl_input" style="width: 120px" readonly="readonly"
							size="30" tabindex="2" /></td>

						<td>
							<div class="buttonset">
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
					<tbody>
					
					
					
						<!-- 뿌려주는부븐 -->
						
						
						
						
						
						
						
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>