<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#department').val().length<1){
				alert('학과를 선택하세요');
				$('#department').focus();
				event.preventDefault();
			} else if($('#subjCode').val().length<1){
				alert('과목명을 입력하세요');
				$('#subjCode').focus();
				event.preventDefault();
			} else if($('#openYear').val().length<1){
				alert('연도를 선택하세요');
				$('#openYear').focus();
				event.preventDefault();
			} else if($('#semesterType').val().length<1){
				alert('학기를 선택하세요');
				$('#semesterType').focus();
				event.preventDefault();
			} else if($('#timetable').val().length<1){
				alert('강의시간을 선택하세요');
				$('#timetable').focus();
				event.preventDefault();
			} else if($('#classroom').val().length<1){
				alert('강의실을 선택하세요');
				$('#classroom').focus();
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
		
		$('#subject').change(function() {
			var str = $("#subject option:selected").val();
			var strArr = str.split('.');
			var idx = $("#subject option").index( $("#subject option:selected") );
			if(idx != 0) {
				$('#subjCode').attr("value", strArr[0]);
				$('#profNo').attr("value", strArr[1]);
			} else {
				$('#subjCode').attr("value", '');
				$('#profNo').attr("value", '');
			}
		});
		
		$('#semesterType').change(function() {
			var idx = $("#semesterType option").index( $("#semesterType option:selected") );
			if(idx != 0) {
				$('#semester').attr("value", $("#semesterType option:selected").val());	
			} else {
				$('#semester').attr("value", '');
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
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <select class="form-control" name="department" id="department"> -->
                                                        <select class="form-control" name="deptNo" id="deptNo">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="deptVo" items="${deptList }" varStatus="status">
																<option value="${deptVo.deptNo }">${deptVo.deptName }</option>
											            	</c:forEach>
														</select>
														<!-- <input type="hidden" name="deptNo" id="deptNo"> -->	            
                                                        <label for="inputFirstName">학과</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<!-- <select class="form-control" name="subject" id="subject"> -->
                                                    	<select class="form-control" name="subject" id="subject">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="subjVo" items="${subjectList }" varStatus="status">
																<option value="${subjVo.subjCode }.${subjVo.profNo }" >${subjVo.subjName } - ${subjVo.profName }</option>
											            	</c:forEach>
														</select>
                                                        <input type="hidden" name="subjCode" id="subjCode"/>
                                                        <input type="hidden" name="profNo" id="profNo"/>
                                                        <label for="inputFirstName">과목명</label>
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
                                                        <!-- <select class="form-control" name="semesterType" id="semesterType"> -->
                                                        <select class="form-control" name="semester" id="semester">
														    <option value="">---선택하세요---</option>
														    <option value="1학기">1학기</option>
														    <option value="2학기">2학기</option>
														    <option value="여름계절학기">여름계절학기</option>
														    <option value="겨울계절학기">겨울계절학기</option>
														</select>
														<!-- <input type="text" name="semester" id="semester"/> -->
                                                        <label for="inputFirstName">학기</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <select class="form-control" name="timetable" id="timetable"> -->
                                                        <select class="form-control" name="timetableCode" id="timetableCode">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="timeVo" items="${timetableList }" varStatus="status">
																<option value="${timeVo.timetableCode }">${timeVo.timetableName }</option>
											            	</c:forEach>
														</select>
														<!-- <input type="hidden" name="timetableCode" id="timetableCode"> -->	            
                                                        <label for="inputFirstName">시간표</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <select class="form-control" name="classroom" id="classroom"> -->
                                                        <select class="form-control" name="classroomCode" id="classroomCode">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="classroomVo" items="${classroomList }" varStatus="status">
																<option value="${classroomVo.classroomCode }">${classroomVo.buildingName } ${classroomVo.classroomName }</option>
											            	</c:forEach>
														</select>
														<!-- <input type="hidden" name="classroomCode" id="classroomCode"> -->	            
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