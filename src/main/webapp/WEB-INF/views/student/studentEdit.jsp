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
                                      <h6>학생번호</h6><!-- 데이터 긁어올 예정 -->
                                   </div>
                                   <div class="card-body">
                                       <form>
                                           <div class="row mb-3">
                                                <div class="col-md-6">
                                                   <div class="form-floating">
                                                       <input class="form-control" id="name" type="text" placeholder="Enter your last name" readonly/>
                                                       <label for="name">이름</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                       <label for="inputPasswordConfirm">아이디</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" readonly/>
                                                       <label for="inputPassword">학과</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                
                                               </div>
                                           </div>
                                           <div class="form-floating mb-3">
                                               <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" />
                                               <label for="inputEmail">이메일</label>
                                           </div>
                                           <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" />
                                                       <label for="inputPassword">비밀번호</label>
                                                   </div>
                                               </div>
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                       <label for="inputPasswordConfirm">비밀번호 확인</label>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="mt-4 mb-0">
                                               <div class="d-grid"><a class="btn btn-primary btn-block" href="#">수정</a></div>
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

