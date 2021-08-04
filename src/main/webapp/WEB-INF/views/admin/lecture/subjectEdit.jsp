<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			
			if($('#subjName').val().length<1){
				alert('과목명을 입력하세요');
				$('#subjName').focus();
				event.preventDefault();
			} else if($('#subjType').val().length<1){
				alert('교과구분을 선택하세요');
				$('#subjType').focus();
				event.preventDefault();
			} else if($('#credit').val().length<1){
				alert('학점을 입력하세요');
				$('#credit').focus();
				event.preventDefault();
			} else if($('#credit').val() == 0 || $('#credit').val() > 3){
				alert('학점은 1~3 사이에서만 입력 가능합니다.');
				$('#credit').focus();
				event.preventDefault();
			} else if($('#personnel').val().length<1){
				alert('수강인원을 입력하세요');
				$('#personnel').focus();
				event.preventDefault();
			} else if($('#personnel').val() < 10 || $('#personnel').val() > 100){
				alert('수강인원은 10~100명 사이에서만 입력 가능합니다.');
				$('#personnel').focus();
				event.preventDefault();
			} else if($('#explanation').val().length<1){
				alert('과목소개란을 입력하세요');
				$('#explanation').focus();
				event.preventDefault();
			}
			
		});
		
		$('#subjType').change(function() {
			var idx = $("#subjType option").index( $("#subjType option:selected") );
			if(idx != 0) {
				$('#typeCode').attr("value", idx);	
			} else {
				$('#typeCode').attr("value", '');
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">과목정보 수정</h3></div>
                                    <div class="card-body">
                                         <form name="registerfrm" method="post" action="<c:url value='/admin/lecture/subjectEdit'/>">
                                            <input name="subjCode" id="subjCode" type="hidden" value="${vo.subjCode}" />
                                            <div class="row mb-3">
                                            	<div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="subjName" id="subjName" type="text" value="${vo.subjName}" placeholder="Enter your first name" />
                                                <label for="inputFirstName">과목명</label>
                                                    </div>
                                                </div>
                                            	<div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <select class="form-control" name="subjType" id="subjType">
														    <option value="">---선택하세요---</option>
														    <!-- 반복문 시작 -->	
											            	<c:forEach var="typeVo" items="${typeList }" varStatus="status">
																<option value="${typeVo.typeCode }" 
																	<c:if test="${vo.typeCode == typeVo.typeCode }">
																		selected="selected"
																	</c:if>
																>${typeVo.type }</option>
											            	</c:forEach>
														</select>
														<input type="hidden" name="typeCode" id="typeCode">	            
                                                        <label for="inputFirstName">교과구분</label>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<input class="form-control" name="credit" id="credit" type="number" value="${vo.credit}" min="1" max="3">
                                                        <label for="inputFirstName">학점</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	<input class="form-control" name="personnel" id="personnel" type="number" value="${vo.personnel}" min="10" max="100">
                                                        <label for="inputFirstName">수강인원</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="explanation" id="explanation" type="text" value="${vo.explanation}" placeholder="Enter your first name" />
                                                <label for="inputFirstName">과목소개</label>
                                            </div>
                                            <div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: left">
	                                                <div class="d-grid">
	                                                	<input type="submit" id="wr_submit" class="btn btn-primary btn-block" value="수정하기">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0" style="width: 48%; float: right">
	                                                <div class="d-grid"><a class="btn btn-secondary btn-block" 
	                                                	href="<c:url value='/admin/lecture/subjectList'/>">취소</a></div>
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