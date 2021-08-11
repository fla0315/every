<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<style type ="text/css">
	.reg_box {
		border: 1px solid #cce1e4;
		border-radius: 30px;
		margin: 5% auto; 
		padding: 30px; 
		height: auto; 
		width: 450px;
		background-color: rgba(255, 255, 255, 0.8);
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

	 //회원유형이 교수일 경우에만 email 활성화
	if ($('#chk_info').val()!="professor") {
		$('#email').css("display","none");
		$('#email').attr("disabled",true);
		$('#email1').val('end');
		$('#email_check').val('none');
		$('#chkmail').val('none');
	}
 
	
	//아이디
	$('.registeration').click(function(){
		 if($('#userid').val()==""){
				alert('아이디를 입력해주세요.');
				$('#userid').focus();
				event.preventDefault();		
		}else if(!validate_check($('#userid').val())){
				alert('아이디는 영문, 숫자, _만 가능합니다.');
				$('#userid').focus();
				event.preventDefault();					
		}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인 해야합니다.');
				$('#userid').focus();
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
			alert('사용하실 수 있는 비밀번호 입니다.');
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
		
		 
	//휴대폰 인증절차 확인작업
	}else if($('#chkphone').val()==""){
		alert('휴대폰인증을 진행해주세요.');
		event.preventDefault();	
	}else if($('#chkphone').val()!=$('#phone_check').val()){
		alert('휴대폰 인증실패.');
		$('#phone_check').focus();
		event.preventDefault();	
		
	//이메일 인증절차 확인작업
	}else if($('#chkmail').val()==""&&$('#chk_info').val=="professor"){
		alert('이메일인증을 진행해주세요.')
	}else if($('#chkmail').val()!=$('#email_check').val()){
		alert('이메일 인증실패.')
		$('#email_check').focus();
		event.preventDefault();	
	}
		 
	}); 
	

	
//id	
//ajax
$('#userid').keyup(function(){
	var data=$(this).val();
	var data2=$('#chk_info').val();
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/idcheck'/>",
			type:"post",
			data:{"userid":data,"chk_info":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#check_id').html("이미 등록된 아이디").css("color", "red");
					$('#chkId').val('N');
				}else{
					$('#check_id').html("사용가능한 아이디입니다.").css("color", "blue");
					$('#chkId').val('Y').css("color","red");
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
	var data2=$('#pwd2').val();
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/pwd1check'/>",
			type:"post",
			data:"pwd="+data,
			success:function(res){
				//alert(res);
				if(res){
					$('.checkpwd').html("사용하실 수 있는 비밀번호입니다.").css("color", "blue");
					 $('#chkpwd').val('Y').css("color","red"); 
				}else{
					$('.checkpwd').html("비밀번호는 5~10자리로 입력해주세요.").css("color", "red");								
					 $('#chkpwd').val('N'); 
				}
				if (data2.length>2) {
					if(data2!=data){
						$('.check_pwd2').html("두 비밀번호가 다릅니다.").css("color", "red");
					}else{
						$('.check_pwd2').html("두 비밀번호가 일치합니다.").css("color", "blue");	
					}
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
	var chk_info= $("#chk_info").val();

	
	//중복확인하고, 없으면 돌려야지
	$.ajax({
		url:"<c:url value='/reg/regphonecheck'/>",
		type:"GET",
		data:{"phonenum":phonenum, "chkinfo":chk_info},
		success:function(res){
			//alert(res);
			if (res) {
				$('#checknum').html("이미 등록된 휴대폰입니다").css("color", "blue");
				$('#chkphone2').val(res).css("color","red"); 
				event.preventDefault();	
			}else{
				$('#checknum').html("인증번호가 발송되었습니다.").css("color", "blue");
				$.ajax({
					url:"<c:url value='/reg/phonecheck'/>",
					type:"GET",
					data:"phonenum="+phonenum,
					success:function(res){
						//alert(res);
						$('#chkphone').val(res).css("color","red"); 
					},
					error:function(xhr, status, error){
						alert("error 발생!!" + error);
					}
				});				
				
			}
			
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
					$('#checknum').html("휴대폰 인증되셨습니다.").css("color", "blue");
					
				}else{
					$('#checknum').html("인증실패").css("color", "red");								
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	
});



//이메일 체크하기
$('#emailconfirm').click(function(){
	var email1 = $('#email1').val();
	var email2 = $('#email2').val();
	
	var emailaddress= email1+"@"+email2
	
	$.ajax({
		url:"<c:url value='/reg/registeremailcheck'/>",
		type:"post",
		data:{"email1":email1,"email2":email2},
		success:function(res){
		
			if(res){
				$('#checkemail').html("이미 사용중인 이메일입니다.").css("color", "blue");
				$('#regemail').val('Y').css("color","red"); 
				event.preventDefault();	
				
			}else{
				$.ajax({
					url:"<c:url value='/reg/emailcheck'/>",
					type:"GET",
					data:"emailaddress="+JSON.stringify(emailaddress),
					contentType: "application/json; charset=utf-8;",
		            dataType: "json",
					success:function(res){
						//alert(res);
						$('#chkmail').val(res).css("color","red"); 
					},
					error:function(xhr, status, error){
						alert("error 발생!!" + error);
					}
				});				
				
			}
		},
		error:function(xhr, status, error){
			alert("error 발생!!" + error);
		}
	});				


	}); 
	
//이메일 인증번호 체크하기	
$('#email_check').keyup(function(){
	var data2=$(this).val();
	var data1=$('#chkmail').val();
	
		$.ajax({
			url:"<c:url value='/reg/numcheck'/>",
			type:"post",
			data:{"num1":data1,"num2":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#checkemail').html("이메일 인증되셨습니다.").css("color", "blue");
					
				}else{
					$('#checkemail').html("인증실패").css("color", "red");								
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});				
	
		});
});

</script>


<!-- 여기부터 페이지 -->
<div class="reg_box">
<div class="container">
<div>
	<article class="align_center">
		<form name="register" method="post" action="<c:url value='/reg/write'/>" >
			<fieldset>
				<br>
				<div class="text-center">
					<h4>회원가입</h4>
				</div>
				<!-- 회원 번호에서 받아온 값(회원번호, 타입) -->
					<input type="hidden" name="stuno" id="stuno" value="${param.stuno}">
					<input type="hidden" name="chk_info" id="chk_info" value="${param.chk_info}">
				<!-- 아이디 -->
					<br>
				<div class="id" style="width: 200px;">
					<label for="user_id">아이디</label> <br> 
					<input type="text" class="userid" id="userid" name="userid" placeholder="ID" required
						style="ime-mode: inactive"> <br> 
						<div class="check_id" id="check_id"></div>
				</div>
				<!-- 비밀번호 -->
				<div class="pwd" style="width: 200px;">
					<label for="pwd">비밀번호</label> 
					<br> 
					<input type="password" class="form" id="pwd" name="pwd" placeholder="password" required
						style="ime-mode: inactive"> 
					
				</div>
				<div class="checkpwd" id="checkpwd" style="width: 350px;"></div>
				<br>

				<!-- 비밀번호 확인용 -->
				<div class="pwd2" style="width: 200px;">
					<label for="pwd">비밀번호 확인</label> 
					<br> 
					<input type="password"
						class="form" id="pwd2" name="pwd2" placeholder="pass" required>
				</div>
				<div class="check_pwd2" id="check_pwd2" style="width: 350px;"></div>
				<br>

				<!-- 이메일 -->
				<div id="email" class="email" style="width: 400px;">
					<label for="email">이메일</label> 
					<br> 
					<input type="text" class="email1" id="email1" name="email1" placeholder="E-MAIL"> 
						<span class="@" id="@">@</span> 
					<select	class="input" name="email2" id="email2">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select> 
				<br>
				<br>
				<input type="button" value="이메일 인증번호 보내기" id="emailconfirm"> 
				<br>
				<input type="text" class="email_check" id="email_check" placeholder="이메일 인증번호" required>
				<br>
					<span class="checkemail" id="checkemail"></span>
				</div>
				<!-- 휴대폰 -->
				<div class="phone">
					<label for="hp1">휴대폰</label> <br> 
					<div class="row">
					<select class="custom-select" id="phone1" name="phone1" title="휴대폰 앞자리" style="width: 80px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select>
					&nbsp;-&nbsp;<input type="text" class="phone2 form-control" id="phone2" name="phone2" style="width: 80px;">&nbsp;-&nbsp;<input type="text" class="phone3 form-control" id="phone3" name="phone3" style="width: 80px;">	
					&nbsp;&nbsp;<input type="button" class="btn btn-dark" value="인증번호" id="phoneconfirm" style="font-size:0.8em; width:100px">
					</div>   
					<div class="check_phone" id="check_phone"></div>
					 <br>
					
					<input type="text" class="phone_check" id="phone_check" placeholder="인증번호" required>
					
				</div>
					<div class="checknum" id="checknum"></div>
					
				<br>
			</fieldset>
			<div class="text-center">
				<input type="submit" class="registeration btn btn-dark" value="회원가입">
			</div>
		</form>
			
		<input type ="hidden" name="chkId" id="chkId"> 
			  <input type ="hidden" name="chkpwd" id="chkpwd">
			   <input type ="hidden" name="chkphone" id="chkphone">
			   <input type= "hidden" name ="chkmail" id="chkmail">
			   		   <input type= "hidden" name ="regemail" id="regemail">

			   
	</article>

	</div>
	
</div>
</div>




<%@ include file="../inc/bottom.jsp"%>
