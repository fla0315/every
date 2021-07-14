<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>


		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<section class="testimonial py-5" id="testimonial">
    <div class="container">
        <div class="row ">
            <div class="col-md-8 py-5 border">
                <h4 class="pb-4">장학금 신청</h4>
                <form>
                
                
                    <div class="form-row">
                        <div class="form-group col-md-6">
                          <label >이름</label> 
                          <input id="Full Name" name="Full Name" placeholder="이름" class="form-control" type="text">
                        </div>
                     </div>
                      
                      
                      <div class="form-row">
                        <div class="form-group col-md-6">
                        <label >학번</label> 
                          <input type="email" class="form-control" id="inputEmail4" placeholder="학번">
                        </div>
                      </div>
                      
                     <div class="form-row">
                        <div class="form-group col-md-6">
                        <label >전화번호</label> 
                          <input type="email" class="form-control" id="inputEmail4" placeholder="전화번호">
                        </div>
                      </div>
                      
                    <div class="form-row">
                    
                        <div class="form-group col-md-6">
                              <label >장학금 항목</label>      
                                  <select id="inputState" class="form-control">
                                    <option selected>선택하세요</option>
                                    <option> 국가장학금 </option>
                                    <option> 교직장학금</option>
                                    <option> 어학연수 장학금</option>
                                  </select>
                        </div>
                        
                        
                        <div class="form-group col-md-12">
                        <label >신청사유</label>  
                                  <textarea id="comment" name="comment" cols="40" rows="5" class="form-control"></textarea>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="form-row">
                        <div class="form-group">
                            <div class="form-group">
                                <div class="form-check">
                                  <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                                  <label class="form-check-label" for="invalidCheck2">
                                    <small>동의하십니까</small>
                                  </label>
                                </div>
                              </div>
                    
                          </div>
                    </div>
                    
                    
                    <div class="form-row">
                        <button type="button" class="btn btn-danger">신청</button>
                        <span>&nbsp;&nbsp;</span>
                        <button type="button" class="btn btn-danger">취소</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/bottom.jsp" %>        
