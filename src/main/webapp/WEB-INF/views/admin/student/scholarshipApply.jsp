<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#major').val().length<1){
				alert('학과를 선택하세요');
				$('#major').focus();
				event.preventDefault();
			} else if($('#name').val().length<1){
				alert('이름를 입력하세요');
				$('#name').focus();
				event.preventDefault();
			} else if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			} else if($('#pwd').val()!=$('#pwdChk').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwdChk').focus();
				event.preventDefault();				
			} else if($('#phoneNum').val().length<1){
				alert('전화번호를 입력하세요');
				$('#phoneNum').focus();
				event.preventDefault();
			} else if($('#state').val().length<1){
				alert('학적상태를 선택하세요');
				$('#state').focus();
				event.preventDefault();
			} else if($('#admissionDate').val().length<1){
				alert('입학일자를 입력하세요');
				$('#admissionDate').focus();
				event.preventDefault();
			}
			
		});
		
		/* $('#major').change(function() {
			var idx = $("#major option").index( $("#major option:selected") );
			if(idx != 0) {
				if(idx<10) {
					idx = "0" + idx;
				}
				$('#deptNo').attr("value", idx);	
			} else {
				$('#deptNo').attr("value", '');
			}
		});
			
		$('#admissionDate').change(function() {
			var year = $('#admissionDate').val().substring(0,4);
			$('#admissionYear').attr("value", year);	
		});

		$('#studentName').change(function() {
			var year = $('#studentName').val();
			$('#stuNo').attr("value", year);	
		}); */
		
		
		var date = new Date();
		var selYear = date.getFullYear();
		var selMonth = date.getMonth()+1;
		
		$('#year').val(selYear);
		
		if(selMonth == 7 || selMonth == 8) {
			$('#semester').val("2학기");
		} else if(selMonth == 1 || selMonth == 2) {
			$('#semester').val("1학기");
		}
		
	});	
	
</script>

<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">장학금 신청</h3></div>
                                    <div class="card-body">
                                        <form name="registerfrm" method="post" action="<c:url value='/admin/student/apply_post'/>">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="stuNo" id="stuNo">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="studentVo" items="${studentList }" varStatus="status">
																<option value="${studentVo.stuNo }">${studentVo.major }_${studentVo.stuNo }_${studentVo.name }</option>
											            	</c:forEach>
														</select>
														<!-- <input type="text" name="stuNo" id="stuNo">	    -->         
                                                        <label for="inputFirstName">학생명</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="scholarshipNo" id="scholarshipNo" >
														    <option value="">--선택하세요--</option>
														    <c:forEach var="scholarshipVo" items="${scholarshipList }">
																<option value="${scholarshipVo.scholarshipNo }">${scholarshipVo.scholarshipType }</option>            	
											            	</c:forEach>
														    
														</select>
                                                        <label for="inputPasswordConfirm">장학금종류</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <select class="form-control" name="openYear" id="openYear"  disabled="disabled"></select> -->
                                                        <input class="form-control" name="year" id="year" type="text" placeholder="연도" disabled="disabled"/>
                                                        <label for="inputFirstName">연도</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <select class="form-control" name="semesterType" id="semesterType"> -->
                                                        <!-- <select class="form-control" name="semester" id="semester">
														    <option value="">---선택하세요---</option>
														    <option value="1학기">1학기</option>
														    <option value="2학기">2학기</option>
														</select> -->
														<input class="form-control" name="semester" id="semester" type="text" 
															placeholder="학기" disabled="disabled"/>
														<!-- <input type="text" name="semester" id="semester"/> -->
                                                        <label for="inputFirstName">학기</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: left">
	                                                <div class="d-grid">
	                                                	<input type="submit" id="wr_submit" class="btn btn-primary btn-block" value="신청하기">
	                                                </div> 
	                                            </div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: right">
	                                                <div class="d-grid"><a class="btn btn-secondary btn-block" 
	                                                	href="<c:url value='/admin/student/scholarshipApplyList'/>">취소</a></div>
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