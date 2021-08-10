<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		
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
                                                        <input class="form-control" name="year" id="year" type="text" placeholder="연도" disabled="disabled"/>
                                                        <label for="inputFirstName">연도</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
														<input class="form-control" name="semester" id="semester" type="text" 
															placeholder="학기" disabled="disabled"/>
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