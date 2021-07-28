<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#update').click(function(){
			if($('#dept').val().length<1){
				alert('학과를 선택하세요');
				$('#dept').focus();
				event.preventDefault();
			} else if($('#position').val().length<1){
				alert('직책을 입력하세요');
				$('#position').focus();
				event.preventDefault();
			} else if($('#profName').val().length<1){
				alert('이름을 입력하세요');
				$('#profName').focus();
				event.preventDefault();
			} else if($('#profPh').val().length<1){
				alert('휴대전화를 입력하세요');
				$('#profPh').focus();
				event.preventDefault();
			} else if($('#profPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#profPwd').focus();
				event.preventDefault();
			} else if($('#profPwd').val()!=$('#pwdChk').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwdChk').focus();
				event.preventDefault();				
			} else if($('#profEmail').val().length<1){
				alert('이메일주소를 입력하세요');
				$('#profEmail').focus();
				event.preventDefault();
			} else if($('#admissionDate').val().length<1){
				alert('부임일자를 입력하세요');
				$('#profStartDate').focus();
				event.preventDefault();
			}
			
		});
		
		$('#dept').change(function() {
			var idx = $("#dept option").index( $("#dept option:selected") );
			if(idx != 0) {
				$('#deptNo').attr("value", idx);	
			} else {
				$('#deptNo').attr("value", '');
			}
		});
		
		$('#position').change(function() {
			var idx = $("#position option").index( $("#position option:selected") );
			if(idx != 0) {
				$('#positionNo').attr("value", idx);	
			} else {
				$('#positionNo').attr("value", '');
			}
		});
		
	});	
	
</script>

<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">교수정보 수정</h3></div>
                                    <div class="card-body">
                                         <form name="registerfrm" method="post" action="<c:url value='/admin/professor/professorEdit'/>">
                                            <input type="hidden" name="profNo" id="profNo" value="${vo.profNo }">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="dept" id="dept">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="deptVo" items="${deptList }" varStatus="status">
																<option value="${deptVo.deptNo }"
																	<c:if test="${vo.deptNo == deptVo.deptNo }">
																		selected="selected"
																	</c:if>
																>${deptVo.deptName }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="deptNo" id="deptNo" value="${vo.deptNo }">	            
                                                        <label for="inputFirstName">학과</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="position" id="position">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="positionVo" items="${positionList }" varStatus="status">
																<option value="${positionVo.positionNo }"
																	<c:if test="${vo.positionNo == positionVo.positionNo }">
																		selected="selected"
																	</c:if>
																>${positionVo.positionName }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="positionNo" id="positionNo" value="${vo.positionNo }">	            
                                                        <label for="inputFirstName">직책</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="profName" id="profName" value="${vo.profName }" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="profId" id="profId" type="text" value="${vo.profId }" placeholder="Enter your last name" />
                                                        <label for="inputLastName">아이디</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="profPwd" id="profPwd" type="password" value="${vo.profPwd }" placeholder="Create a password" />
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="pwdChk" id="pwdChk" type="password" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                                    </div>
                                                </div>
                                            </div>
	                                        <div class="row mb-3">
	                                            <div class="col-md-6">
	                                                <div class="form-floating">
	                                                    <input class="form-control" name="profEmail" id="profEmail" type="email" value="${vo.profEmail }" placeholder="name@example.com" />
	                                                    <label for="inputLastName">이메일주소</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6">
	                                                <div class="form-floating">
	                                                    <input class="form-control" name="profPh" id="profPh" type="text" value="${vo.profPh }" placeholder="Enter your last name" />
	                                                    <label for="inputLastName">휴대전화</label>
	                                                </div>
	                                            </div>
	                                        </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                    	<c:set var="profStartDate" value="${vo.profStartDate}"/>
                                                        <c:set var="profEndDate" value="${vo.profEndDate}"/>
                                                        <input class="form-control" type='date' name='profStartDate' value="${fn:substring(profStartDate,0,10) }" id='profStartDate' placeholder="입학일자"/>
                                                        <label for="inputLastName">부임일자</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" type='date' name='profEndDate' value="${fn:substring(profEndDate,0,10) }" id='profEndDate' placeholder="졸업일자"/>
                                                        <label for="inputLastName">퇴임일자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: left">
	                                                <div class="d-grid">
	                                                	<input type="submit" id="update" class="btn btn-primary btn-block" value="수정">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: right">
	                                                <div class="d-grid"><a class="btn btn-secondary btn-block" 
	                                                	href="<c:url value='/admin/professor/professorList'/>">취소</a></div>
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