<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        
<style type="text/css">
   .topdown {
        padding-top:100px;
   }
</style>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                       <div class="row justify-content-center topdown">
                           <div class="col-lg-7">
                               <div class="card shadow-lg border-0 rounded-lg mt-5">
                                   <div class="card-header">
                                      <h3 class="text-center font-weight-light my-4">학생 회원정보수정</h3>
                                      <h6>No.${map['STU_NO']}</h6><!-- 데이터 긁어올 예정 -->
                                      <%-- <span>${sessionScope.userid}</span> --%>
                                   </div>
                                   <div class="card-body">
                                         <form name="frm" method="post" action="<c:url value='/student/studentEdit'/>">
                                        	 <input type="hidden" name="stuNo" value="${map['STU_NO'] }">
                                        	  
                                           <div class="row mb-3">
                                                <div class="col-md-6">
                                                   <div class="form-floating">
                                                     <input class="form-control" name="name" id="name" type="text" value="${map['NAME'] }" readonly/>
                                                       <label for="name">이름</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" name="studentId" type="text" value="${map['STUDENT_ID'] }" />
                                                       <label for="inputPasswordConfirm">아이디</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="row mb-3">
                                               <div class="col-md-6">
                                                  <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="deptName" type="text" value="${map['DEPT_NAME'] }" readonly/>
                                                       <label for="dept">학과</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                
                                               </div>
                                           </div>


											<div class="row mb-3">
												<div class="col-md-6">
													<div class="form-floating mb-3 mb-md-0">
														<input class="form-control" name="phonenum" id="phonenum" type="tel" placeholder="010-1234-4567" value="${map['PHONENUM'] }" />
														<label for="inputEmail">전화번호</label> 
													</div>
												</div>
											</div>
											
											
							 				<div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" name="pwd" type="password" placeholder="비밀번호" />
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
                </main>
            </div>
         </div>



<%@ include file="../inc/bottom.jsp" %>        

