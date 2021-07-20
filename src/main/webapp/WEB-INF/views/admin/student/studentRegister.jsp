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
		
	});	
	
</script>

<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">학생 등록</h3></div>
                                    <div class="card-body">
                                        <form name="registerfrm" method="post" action="<c:url value='/admin/register_post'/>">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <input class="form-control" id="inputFirstName" type="text" placeholder="학과" /> -->
                                                        <select class="form-control" name="major" id="major">
														    <option value="">--선택하세요--</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="deptVo" items="${deptList }">
																<option value="${deptVo.deptName }">${deptVo.deptName }</option>            	
											            	</c:forEach>
														</select>
                                                        <label for="inputFirstName">학과</label>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="name" id="name" type="text" placeholder="이름" />
                                                        <label for="inputFirstName">이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="pwd" id="pwd" type="password" placeholder="초기 비밀번호" />
                                                        <label for="inputPassword">초기 비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="pwdChk" id="pwdChk" type="password" placeholder="비밀번호 확인" />
                                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="phoneNum" id="phoneNum" type="text" placeholder="휴대전화" />
                                                        <label for="inputPhoneNumber">휴대전화</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <!-- <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="학적상태" /> -->
                                                        <select class="form-control" name="state" id="state">
														    <option value="">--선택하세요--</option>
														    <c:forEach var="stateVo" items="${stateList }">
																<option value="${stateVo.state }">${stateVo.stateName }</option>            	
											            	</c:forEach>
														    
														</select>
                                                        <label for="inputPasswordConfirm">학적상태</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <!-- <input class="form-control" id="inputLastName" type="text" placeholder="입학일자" /> -->
                                                        <input class="form-control" type='date' name='admissionDate' id='admissionDate' placeholder="입학일자"/>
                                                        <label for="inputLastName">입학일자</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <!-- <input class="form-control" id="inputLastName" type="text" placeholder="입학일자" /> -->
                                                        <input class="form-control" type='date' name='graduationDate' id='graduationDate' placeholder="졸업일자"/>
                                                        <label for="inputLastName">졸업일자</label>
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
	                                                	href="<c:url value='/admin/student/studentList'/>">취소</a></div>
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