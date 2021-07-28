<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#dept').val().length<1){
				alert('부서를 선택하세요');
				$('#dept').focus();
				event.preventDefault();
			} else if($('#position').val().length<1){
				alert('직책을 입력하세요');
				$('#position').focus();
				event.preventDefault();
			} else if($('#empName').val().length<1){
				alert('이름을 입력하세요');
				$('#empName').focus();
				event.preventDefault();
			} else if($('#authority').val().length<1){
				alert('권한을 입력하세요');
				$('#authority').focus();
				event.preventDefault();
			} else if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			} else if($('#pwd').val()!=$('#pwdChk').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwdChk').focus();
				event.preventDefault();				
			} else if($('#startDate').val().length<1){
				alert('입사일자를 입력하세요');
				$('#startDate').focus();
				event.preventDefault();
			}
			
		});
		
		$('#dept').change(function() {
			var idx = $("#dept option").index( $("#dept option:selected") );
			if(idx != 0) {
				$('#depCode').attr("value", idx);	
			} else {
				$('#depCode').attr("value", '');
			}
		});
		
		$('#position').change(function() {
			var idx = $("#position option").index( $("#position option:selected") );
			if(idx != 0) {
				$('#positionCode').attr("value", idx);	
			} else {
				$('#positionCode').attr("value", '');
			}
		});
		
		$('#authority').change(function() {
			var idx = $("#authority option").index( $("#authority option:selected") );
			if(idx != 0) {
				$('#authCode').attr("value", idx);	
			} else {
				$('#authCode').attr("value", '');
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">임직원 등록</h3></div>
                                    <div class="card-body">
                                        <form name="registerfrm" method="post" action="<c:url value='/admin/employee/register_post'/>">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="dept" id="dept">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="deptVo" items="${deptList }" varStatus="status">
																<option value="${deptVo.depName }">${deptVo.depName }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="depCode" id="depCode">
                                                        <label for="inputFirstName">부서</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select class="form-control" name="position" id="position">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="posVo" items="${posList }" varStatus="status">
																<option value="${posVo.positionName }">${posVo.positionName }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="positionCode" id="positionCode">
                                                        <label for="inputLastName">직책</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="empName" id="empName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select class="form-control" name="authority" id="authority">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="authVo" items="${authList }" varStatus="status">
																<option value="${authVo.authDesc }">${authVo.authDesc }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="authCode" id="authCode">
                                                        <label for="inputLastName">권한</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="pwd" id="pwd" type="password" placeholder="Create a password" />
                                                        <label for="inputPassword">초기 비밀번호</label>
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
                                                        <input class="form-control" type='date' name='startDate' id='startDate' placeholder="입사일자"/>
                                                        <label for="inputLastName">입사일자</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" type='date' name='resignationDate' id='resignationDate' placeholder="퇴사일자"/>
                                                        <label for="inputLastName">퇴직일자</label>
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
	                                                	href="<c:url value='/admin/employee/employeeList'/>">취소</a></div>
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