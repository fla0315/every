<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">학사일정 등록</h3></div>
                                    <div class="card-body">
                                        <form name="registerfrm" method="post" action="<c:url value='/admin/campusInfo/register_post'/>">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="contents" id="contents" type="text" placeholder="Enter your first name" />
                                                <label for="inputFirstName">학사일정내용</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" type='date' name='sDate' id='sDate' placeholder="시작일자"/>
                                                        <label for="inputLastName">시작일</label>
                                                        <input type="hidden" name="admissionYear" id="admissionYear">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" type='date' name='eDate' id='eDate' placeholder="종료일자"/>
                                                        <label for="inputLastName">종료일</label>
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
	                                                	href="<c:url value='/admin/campusInfo/calendar'/>">취소</a></div>
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