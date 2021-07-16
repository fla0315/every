<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@ include file="../inc/admin_top.jsp"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<style type ="text/css">
	
	.reg_box {
		border: 1px solid #cce1e4;
		margin: 100px auto; 
		padding: 30px; 
		height: auto; 
		width: 450px;
		box-shadow: 0px 0px 14px 10px rgba(161,140,183,0.3);
	}
	.col-md-8 border{
		margin:100px auto;
		padding: 10px;
		width: 600px;
	}
</style>	
	
	
<script type="text/javascript">

function validate_check(id){
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(id);
/* 		정규식  /^[a-zA-Z0-9_]+$/g
	a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
	끝나야 한다는 의미
	닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미
*/ 
}

//유효성검사
$(function(){
	//아이디
	$('#submit').click(function(){
		
		 if($('#student_id').val()==""){
				alert('아이디를 입력해주세요.');
				$('#student_id').focus();
				event.preventDefault();		
		}else if(!validate_check($('#student_id').val())){
				alert('아이디는 영문, 숫자, _만 가능합니다.');
				$('#student_id').focus();
				event.preventDefault();					
		}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인 해야합니다.');
				$('#student_id').focus();
				event.preventDefault();		
		
	 
	//비밀번호
	}else if($('#pwd').val()==""){
			alert('비밀번호를 입력해주세요.');
			$('#pwd').focus();
			event.preventDefault();			
		}else if(!validate_check($('#pwd').val())){
			alert('비밀번호는 영문, 숫자, _만 가능합니다.');
			$('#pwd').focus();
			event.preventDefault();	
		}else if($('#pwd').val().length<5||$('#pwd').val().length>11){
			alert('비밀번호 기준 확인');
			$('#pwd').focus();
			event.preventDefault();	
	//비밀번호 확인작업		
	
		}else if($('#pwd2').val()==""){
			alert('확인 비밀번호를 입력해주세요.');
			$('#pwd2').focus();
			event.preventDefault();	
		}else if($('#pwd2').val()!=$('#pwd').val()){
			alert('확인 비밀번호가 다릅니다.');
			$('#pwd2').focus();
			event.preventDefault();		
		
		 
	//인증절차 확인작업
	}else if($('#chkphone').val()==""){
		alert('휴대폰인증을 진행해주세요.');
		event.preventDefault();	
	}else if($('#chkphone').val()!=$('#phone_check').val()){
		alert('인증실패.');
		$('#phone_check').focus();
		event.preventDefault();	
	}
	}); 
	

	
//id	
//ajax
$('#student_id').keyup(function(){
	var data=$(this).val();
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/idcheck'/>",
			type:"post",
			data:"userid="+data,
			success:function(res){
				//alert(res);
				if(res){
					$('#check_id').html("사용가능한 아이디").css("color", "blue");
					$('#chkId').val('Y').css("color","red");
				}else{
					$('#check_id').html("이미 등록된 아이디").css("color", "red");
					$('#chkId').val('N');
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	}else{
		$('#check_id').text('규칙에 맞지 않습니다.').css("color", "brown");
		
	}
});

//pw
$('#pwd').keyup(function(){
	var data=$(this).val();
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/pwd1check'/>",
			type:"post",
			data:"pwd="+data,
			success:function(res){
				//alert(res);
				if(res){
					$('.checkpwd').html("문제없음!").css("color", "blue");
					 $('#chkpwd').val('Y').css("color","red"); 
				}else{
					$('.checkpwd').html("비밀번호는 5~10자리로!").css("color", "red");								
					 $('#chkpwd').val('N'); 
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	}else{
		$('.checkpwd').text('규칙에 맞지 않습니다.').css("color", "brown");
		
	}
});

//pw확인
$('#pwd2').keyup(function(){
	var data2=$(this).val();
	var data1=$('#pwd').val();
	if(data2.length>=2){
		$.ajax({
			url:"<c:url value='/reg/pwdcheck'/>",
			type:"post",
			data:{"pwd":data1,"pwd2":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('.check_pwd2').html("두 비밀번호가 일치합니다.").css("color", "blue");
					
				}else{
					$('.check_pwd2').html("두 비밀번호가 다릅니다.").css("color", "red");								
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	}
});


//휴대폰 인증
$('#phoneconfirm').click(function(){
	var phone1 = $('#phone1').val();
	var phone2 = $('#phone2').val();
	var phone3 = $('#phone3').val();
	
	var phonenum= phone1+phone2+phone3

		$.ajax({
			url:"<c:url value='/reg/phonecheck'/>",
			type:"GET",
			data:"phonenum="+JSON.stringify(phonenum),
			contentType: "application/json; charset=utf-8;",
            dataType: "json",
			success:function(res){
				//alert(res);
				$('#chkphone').val(res).css("color","red"); 
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	}); 
	
//인증번호 체크하기	
$('#phone_check').keyup(function(){
	var data2=$(this).val();
	var data1=$('#chkphone').val();
	
		$.ajax({
			url:"<c:url value='/reg/numcheck'/>",
			type:"post",
			data:{"num1":data1,"num2":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#checknum').html("인증되셨습니다.").css("color", "blue");
					
				}else{
					$('#checknum').html("인증실패").css("color", "red");								
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	
});
	
});	


</script>



<div class="reg_box">
<div class="container">
<div>
	<article class="align_center">
		<form name="register" method="post" action="<c:url value='/reg/write'/>" >
			<div class="col-11 border" style="width:800">
			<fieldset>
			
				<legend>회원 가입</legend>
					<input type="hidden" name="stuno" id="stuno" value="${param.stuno}">
				<!-- 아이디 -->
					<br>
					<br>
				<div class="id" style="width: 200px;">
					<label for="userid">아이디</label> <br> 
					<input type="text" class="student_id" id="student_id" name="student_id" placeholder="ID" required
						style="ime-mode: inactive"> <br> <span
						class="check_id" id="check_id" style=""></span>
				</div>
				<br>

				<!-- 비밀번호 -->
				<div class="pwd" style="width: 200px;">
					<label for="pwd">비밀번호</label> <br> <input type="password"
						class="form" id="pwd" name="pwd" placeholder="password" required
						style="ime-mode: inactive"> 
						<div class="checkpwd" id="checkpwd"></div>
				</div>
				<br>

				<!-- 비밀번호 확인용 -->
				<div class="pwd2" style="width: 200px;">
					<label for="pwd">비밀번호 확인</label> <br> <input type="password"
						class="form" id="pwd2" name="pwd2" placeholder="pass" required>
					<div class="check_pwd2" id="check_pwd2"></div>
				</div>
				<br>

				<!-- 이메일 
				<div class="email" style="width: 400px;">
					<label for="email">이메일</label> <br> <input type="text"
						class="form" id="email1" name="email1" placeholder="E-MAIL"	required> 
						<span class="@" id="@">@</span> <select
						class="input" name="email2" id="email2">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select> <span class="check_email" id="email_check"></span>
				</div>
				<br> -->

				<!-- 휴대폰 -->
				<div class="phone">
					<label for="hp1">휴대폰</label> <br> 
				<span> 
					<select name="hp1" id="phone1" name="phone1" title="휴대폰 앞자리" style="width: 80px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select>
					&nbsp;-
					 <input type="text" class="phone2" id="phone2" name="phone2" style="width: 80px;">&nbsp;- 
					 <input type="text"	class="phone3" id="phone3" name="phone3" style="width: 80px;">  	
					</span>
					<input type="button" value="인증번호 보내기" id="phoneconfirm"> 
					<div class="check_phone" id="check_phone"></div>
					 <br>
					
					<input type="text" class="phone_check" id="phone_check" placeholder="인증번호" required>
					<span class="checknum" id="checknum"></span>
					
				</div>
				<br>

				<div class="center"></div>
				<input type="submit" id="submit" class="btn btn-danger" value="회원가입"  style="width:80px;">
				
			</fieldset>
			</div>
			 <input type ="hidden" name="chkId" id="chkId"> 
			  <input type ="hidden" name="chkpwd" id="chkpwd">
			   <input type ="hidden" name="chkphone" id="chkphone">

		</form>
	</article>
	</div>
	
</div>
</div>




<%@ include file="../inc/bottom.jsp"%>