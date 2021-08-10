<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function(){
		
		$("#subject").autocomplete({  //오토 컴플릿트 시작
			source: List,	// source는 List 배열
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength: 1,// 최소 글자수
			delay: 100,	//autocomplete 딜레이 시간(ms)
			//disabled: true, //자동완성 기능 끄기
		});
		
		$('#wr_submit').click(function(){
			if($('#subject').val().length<1){
				alert('과목명을 입력하세요');
				$('#subject').focus();
				event.preventDefault();
			} else if($('#deptNo').val().length<1){
				alert('학과를 선택하세요');
				$('#deptNo').focus();
				event.preventDefault();
			} else if($('#professor').val().length<1){
				alert('담당교수를 선택하세요');
				$('#professor').focus();
				event.preventDefault();
			} else if($('#openYear').val().length<1){
				alert('연도를 선택하세요');
				$('#openYear').focus();
				event.preventDefault();
			} else if($('#semester').val().length<1){
				alert('학기를 선택하세요');
				$('#semester').focus();
				event.preventDefault();
			} else if($('#timetableCode').val().length<1){
				alert('강의시간을 선택하세요');
				$('#timetableCode').focus();
				event.preventDefault();
			} else if($('#classroomCode').val().length<1){
				alert('강의실을 선택하세요');
				$('#classroomCode').focus();
				event.preventDefault();
			} 
			
		});
		
		$('#department').change(function() {
			var idx = $("#department option").index( $("#department option:selected") );
			if(idx != 0) {
				$('#deptNo').attr("value", idx);	
			} else {
				$('#deptNo').attr("value", '');
			}
		});
		
		$('#professor').change(function() {
			var idx = $("#professor option").index( $("#professor option:selected") );
			if(idx != 0) {
				$('#profNo').attr("value", $("#professor option:selected").val());	
			} else {
				$('#profNo').attr("value", '');
			}
		});
		
		$('#timetable').change(function() {
			var idx = $("#timetable option").index( $("#timetable option:selected") );
			if(idx != 0) {
				$('#timetableCode').attr("value", idx);	
			} else {
				$('#timetableCode').attr("value", '');
			}
		});
		
		$('#classroom').change(function() {
			var idx = $("#classroom option").index( $("#classroom option:selected") );
			if(idx != 0) {
				$('#classroomCode').attr("value", idx);	
			} else {
				$('#classroomCode').attr("value", '');
			}
		});
		
		var date = new Date();
		var selYear = date.getFullYear();
		var selMonth = date.getMonth()+1;
		console.log(selMonth);
		
		//현재년도를 기준으로 호출
		getYears(selYear);
		
		//현재년도를 select함
		$('#openYear').val(selYear);
		
		//바뀐 년도를 기준으로 다시 option 세팅
		$('#openYear').change(function() {
			var chgYear = $(this).val();
			getYears(chgYear);
			$('#openYear').val(chgYear);
		});
		
		//선택한 과목 번호 불러오기
		$('#subject').change(function() {
			var subjName = $(this).val();
			
			$.ajax({
				url:"<c:url value='/admin/lecture/subjCode?subjName=" + subjName + "'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					
					if(res == null) {
						alert('해당 과목에 대한 정보가 없습니다.');
						$("#subject").empty();

					} else if(res != null) {
						$('#subjCode').val(res);
					}
				},
				error:function(xhr, status, error){
					alert('해당 과목을 찾을 수 없습니다.');
					$('#subject').focus();
					event.preventDefault();
				}
			});
		});
		
		// 학과별 교수목록 불러오기
		$('#deptNo').change(function() {
			
			var deptNo = $(this).val();
			
			$.ajax({
				url:"<c:url value='/admin/lecture/profList?deptNo=" + deptNo + "'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					
					$('#timetableCode').val("").prop("selected", true);
					$("#classroomCode").empty();
					$("#classroomCode").append("<option value='0'>---선택하세요---</option>");
					
					if(res.length == 0) {
						alert('해당 학과에 등록된 교수가 없습니다.');
						$("#professor").empty();
						$("#professor").append("<option value='0'>---선택하세요---</option>");
						
						
					} else if(res.length > 0) {
						$("#professor").empty();
						var result = "";
						$.each(res, function(idx, item){
							result += "<option value='" + item.profNo + "'>" + item.profName + "</option>";
						});
						
						$("#professor").append("<option value='0'>---선택하세요---</option>");
						$("#professor").append(result);
					}
				},
				error:function(xhr, status, error){
					alert("error 발생!" + error);
				}
			});
		});
		
		// 학과별 강의실 목록 불러오기
		$('#timetableCode').change(function() {
			
			var deptNo = $('#deptNo').val();
			var timetableCode = $(this).val();
			
			$.ajax({
				url:"<c:url value='/admin/lecture/usableClassroom?deptNo=" + deptNo 
						+ "&timetableCode=" + timetableCode + "'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					
					if(res.length == 0) {
						alert('해당 시간에 사용 가능한 강의실이 없습니다.');
						$("#classroomCode").empty();
						$("#classroomCode").append("<option value='0'>---선택하세요---</option>");

					} else if(res.length > 0) {
						$("#classroomCode").empty();
						
						var result = "";
						$.each(res, function(idx, item){
							result += "<option value='" + item.classroomCode + "'>" 
								+ item.buildingName + " " + item.classroomName + "</option>";
						});
						
						$("#classroomCode").append("<option value='0'>---선택하세요---</option>");
						$("#classroomCode").append(result);
					}
				},
				error:function(xhr, status, error){
					alert("error 발생!" + error);
				}
			});
		});
		
	});	
	
	function getYears(getY) {
		//기존 option 삭제
		$('#openYear option').remove();
		
		//올해 기준으로 -2년부터 +5년을 보여줌
		var stY = Number(getY) - 2;
		var enY = Number(getY) + 5;
		
		for(var y = stY; y <= enY; y++) {
			$('#openYear').append("<option value='" + y + "'>" + y + "년" + "</option>");
		}
	}
	
	List = ${str}
	
</script>

<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">강의 개설</h3></div>
                                    <div class="card-body">
                                         <form name="registerfrm" method="post" action="<c:url value='/admin/lecture/lectureReg_post'/>">
                                         	<div class="form-floating mb-3">
												<input class="form-control" name="subject" id="subject" placeholder="Enter your first name" />
												<input type="hidden" name="subjCode" id="subjCode"/>
                                                <label for="inputFirstName">과목명</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="deptNo" id="deptNo">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="deptVo" items="${deptList }" varStatus="status">
																<option value="${deptVo.deptNo }">${deptVo.deptName }</option>
											            	</c:forEach>
														</select>
                                                        <label for="inputFirstName">학과</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<select class="form-control" name="professor" id="professor" >
														    <option value="">---선택하세요---</option>
														</select>
                                                        <input type="hidden" name="profNo" id="profNo"/> 
                                                        <label for="inputFirstName">담당교수</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="openYear" id="openYear"></select>
                                                        <label for="inputFirstName">연도</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="semester" id="semester">
														    <option value="">---선택하세요---</option>
														    <option value="1학기">1학기</option>
														    <option value="2학기">2학기</option>
														    <option value="여름계절학기">여름계절학기</option>
														    <option value="겨울계절학기">겨울계절학기</option>
														</select>
                                                        <label for="inputFirstName">학기</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="timetableCode" id="timetableCode">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="timeVo" items="${timetableList }" varStatus="status">
																<option value="${timeVo.timetableCode }">${timeVo.timetableName }</option>
											            	</c:forEach>
														</select>
                                                        <label for="inputFirstName">시간표</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="classroomCode" id="classroomCode">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<%-- <c:forEach var="classroomVo" items="${classroomList }" varStatus="status">
																<option value="${classroomVo.classroomCode }">${classroomVo.buildingName } ${classroomVo.classroomName }</option>
											            	</c:forEach> --%>
														</select>
                                                        <label for="inputFirstName">강의실</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: left">
	                                                <div class="d-grid">
	                                                	<input type="submit" id="wr_submit" class="btn btn-primary btn-block" value="등록하기">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: right">
	                                                <div class="d-grid"><a class="btn btn-secondary btn-block" 
	                                                	href="<c:url value='/admin/lecture/lectureList'/>">취소</a></div>
	                                            </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>



<%@ include file="../../inc/bottom.jsp" %>