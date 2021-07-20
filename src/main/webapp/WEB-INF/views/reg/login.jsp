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
		
		 if($('#user_id').val()==""){
				alert('아이디를 입력해주세요.');
				$('#user_id').focus();
				event.preventDefault();					
		}else if ($('#chkId').val()=='N') {
			alert('없는 아이디입니다.')
			$('#user_id').focus();
			event.preventDefault();	
		}
	 
	//비밀번호
	else if($('#pwd').val()==""){
			alert('비밀번호를 입력해주세요.');
			$('#pwd').focus();
			event.preventDefault();			
		}
		//로그인 실패하기
	else if($('#chkpwd').val()=="N"){
		alert('비밀번호가 틀렸습니다.');
		$('#pwd').focus();
		event.preventDefault();			
	}
	});	
	

	//유형 선택 여부
	$('#user_id').click(function(){
		if($('input:radio[name=chk_info]').is(':checked')==false){
				alert('유형을 선택해주세요.');
				event.preventDefault();	
		}
		});
	
	
	
//ajax
//회원유형(radio변경 시 모든 입력값 초기화)
	$('input:radio[name=chk_info]').click(function(){
			var data=$(this).val(); 
			$('#user_id').val('');
			$('#pwd').val('');
			$('#chkId').val('');
			$('#chkpwd').val('');
			$('#check_id').html("");
				$.ajax({
					url:"<c:url value='/reg/regtypecheck'/>",
					type:"post",
					data:"chk_info="+data,
					success:function(result){
						$('#changeradio').val(result).css("color","blue");
					},
					error:function(xhr, status, error){
						alert("error 발생!!" + error);
					}
		}); 
		});


//ID
$('#user_id').keyup(function(){
	var data=$(this).val();
	var data2=$('input[name="chk_info"]:checked').val(); 
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/idcheck'/>",
			type:"post",
			data:{"userid":data,"chk_info":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#check_id').html("있는 아이디").css("color", "blue");
					$('#chkId').val('Y').css("color","red");
				}else{
					$('#check_id').html("없는 아이디").css("color", "red");
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

$('#pwd').keyup(function(){
	var data=$('#user_id').val();
	var data2=$('#pwd').val();
	var data3=$('input[name="chk_info"]:checked').val(); 
	if(validate_check(data) && data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/loginpwdcheck'/>",
			type:"post",
			data:{"userid":data,"pwd":data2,"chk_info":data3},
			success:function(res){
				//alert(res);
				if(res){
					$('#check_id').html("비밀번호도 맞습니다.").css("color", "blue");
					$('#chkpwd').val('Y').css("color","red");
				}else{
					$('#check_id').html("비밀번호가 틀립니다.").css("color", "red");
					$('#chkpwd').val('N').css("color","blue");
					
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


	
});	


</script>

<div class="reg_box">
<div class="container">
<div>
	<article class="align_center">
		<form name="register" method="post" action="<c:url value='/reg/checklogin'/>">
			<div class="col-11 border" style="width:800">
			<fieldset>
				
				<legend>로그인</legend>
				
				<br>
				<br>
				<input type="radio" name="chk_info" id="chk_info" value="student">학생
				<input type="radio" name="chk_info" id="chk_info" value="admin">관리자 
				<input type="radio" name="chk_info" id="chk_info" value="professor">교수
				
				<br>
				<!-- 아이디 -->
					<br>
				<div class="id" style="width: 200px;">
					<label for="userid">아이디</label> <br> <input type="text"
						class="user_id" id="user_id" name="user_id" placeholder="ID" required
						style="ime-mode: inactive"> <br> <span
						class="check_id" id="check_id" style=""></span>
				</div>
				<br>
				<!-- 비밀번호 -->
				<div class="pwd" style="width: 200px;">
					<label for="pwd">비밀번호</label> <br> <input type="password"
						class="form" id="pwd" name="pwd" placeholder="password" required
						style="ime-mode: inactive"> 
				</div>
				<br>
				<div class="center"></div>
				<input type="submit" id="submit" class="btn btn-danger" value="로그인"  style="width:80px;">
				
			</fieldset>
			</div>
			 <input type ="hidden" name="chkId" id="chkId"> 
			  <input type ="hidden" name="chkpwd" id="chkpwd">
			   <input type ="hidden" name="changeradio" id="changeradio">
			  

		</form>
	</article>
	</div>
	
</div>
</div>




<%@ include file="../inc/bottom.jsp"%>
