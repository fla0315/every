<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/prof_top.jsp" %>
<style type="text/css">
	.topdown {
  		padding-top:100px;
	}
</style>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                       <div class="row justify-content-center topdown">
                           <div class="col-lg-10">
                               <div class="card shadow-lg border-0 rounded-lg mt-5">
                                   <div class="card-header">
                                   	<h3 class="text-center font-weight-light my-4">교수님 회원정보수정</h3>
                                   	<h6>No.${map['PROF_NO'] }</h6><!-- 데이터 긁어올 예정 -->
                                   </div>
                                   <div class="card-body">
                                       <form name="frm" method="post" action="<c:url value='/professor/editProf'/>">
                                       		<input type="hidden" name="profNo" value="${map['PROF_NO'] }">
                                           <div class="row mb-3">
                                          		<div class="col-md-6">
                                                   <div class="form-floating">
                                                       <input class="form-control" name="profName" id="prof_name" type="text" value="${map['PROF_NAME'] }" readonly/>
                                                       <label for="name">이름</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" name="profId" type="text" value="${map['PROF_ID'] }" />
                                                       <label for="profid">아이디</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="dept" type="text" value="${map['DEPT_NAME'] }" readonly/>
                                                       <label for="dept">학과</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="position" type="text" value="${map['POSITION_NAME'] }" readonly/>
                                                       <label for="position">직책</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="form-floating mb-3">
                                               <input class="form-control" name="profEmail" type="email" placeholder="name@example.com" value="${map['PROF_EMAIL'] }"/>
                                               <label for="email">이메일</label>
                                           </div>
                                           <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" name="profPwd" type="password" placeholder="비밀번호" />
                                                       <label for="password">비밀번호</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="passwordConfirm" type="password" placeholder="비밀번호 확인" />
                                                       <label for="passwordConfirm">비밀번호 확인</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="mt-4 mb-0">
                                               <div class="d-grid"><input type="submit" class="btn btn-primary btn-block" value="수정"></div>
                                           </div>
                                       </form>
                                   </div>
                               </div>
                           </div>
                       </div>
            </div>
         </div>
<%@ include file="../inc/bottom.jsp" %>