<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 개별 수정</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/> "></script>
<script type="text/javascript">
$(function() {
	$('#btSave').click(function(){
		if($('input[name=midterm]').val()>100){
			alert("100이하 값을 입력하세요");
			return false;
		}else if($('input[name=finals]').val()>100){
			alert("100이하 값을 입력하세요");
			return false;
		}
		
	});	
	
    $('form[name=frm]').submit(function() {
       event.preventDefault();
       $.ajax({
          type : "POST",
          url : "<c:url value='/professor/evaluation/evaluationEdit'/>",
          data : $(this).serialize(),
          success : function() {
             alert('성적 수정 성공');
             self.close();
             window.opener.location.reload();
          },
          error :  function() {
             alert('성적 수정 실패');
             self.close();
             window.opener.location.reload();
          }
       })
    });
 });
</script>
<style type="text/css">
	.right{
		margin-right:5%;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script type="text/javascript">
</script>
</head>
<body>
<div class="card-header">
	<i class="fas fa-envelope"></i> 성적 수정
</div>
<div class="card-body">
<div class="col-lg-10">
	<form name="frm" method="post" action="<c:url value='/professor/evaluation/evaluationEdit'/>">
		<div class="row mb-3">
         		<div class="col-xs-6 right">
                  <div class="form-floating">
                      <label for="name">이름</label>
                      <input class="form-control" id="name" type="text" value="${map['NAME'] }" readonly/>
                  </div>
              </div>
              <div class="col-xs-6">
                  <div class="form-floating mb-3 mb-md-0">
                      <label for="stuNo">학번</label>
                      <input class="form-control" name="stuNo" type="text" value="${map['STU_NO'] }" readonly/>
                  </div>
              </div>
    	</div>
    	<div class="row mb-3">
    	<div class="col-xs-6 right">
                  <div class="form-floating">
                      <label for="midterm">중간고사</label>
                      <input class="form-control" name="midterm" id="midterm" type="text" value="${map['MIDTERM'] }" />
                  </div>
              </div>
              <div class="col-xs-6">
                  <div class="form-floating mb-3 mb-md-0">
                      <label for="finals">기말고사</label>
                      <input class="form-control" name="finals" type="text" value="${map['FINALS'] }" />
                  </div>
              </div>
        </div>
        <div class="row mb-3">
	        <div class="form-floating">
	        		<input type="hidden" id="subCode" name="subCode" value="${param.openSubCode}">
					<input type="submit" class="btn btn-secondary" id="btSave" value="수정">
			</div>
		</div>
	</form>
</div>
</div>
</body>
</html>