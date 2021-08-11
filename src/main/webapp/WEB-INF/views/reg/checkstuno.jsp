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
		margin: 10% auto; 
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
	var pattern = new RegExp(/^[0-9]+$/g);
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
	$('#register').click(function(){
		
		if($('#chkstu').val()==""){
				alert('학번을 입력해주세요.');
				$('#stuno').focus();
				event.preventDefault();	
		}else if ($('input[name="chk_info"]:checked').val()=="") {
				alert('회원유형을 선택해 주세요');
				event.preventDefault();
		}else if($('#chkstu').val()!='Y'){
				alert('회원번호를 다시 확인해주세요.');
				$('#chkstu').focus();
				event.preventDefault();	
		}else if ($('#checkalready').val()=='Y') {
			     alert('이미 가입하신 회원입니다.');
			 	event.preventDefault();	
		}
		}); 
	
		//유형 선택 여부
		$('#stuno').click(function(){
			if($('input:radio[name=chk_info]').is(':checked')==false){
					alert('회원 유형을 선택해주세요.');
					event.preventDefault();	
			}}); 
	

	

//ajax

//회원번호 확인
$('#stuno').keyup(function(){
	var data=$(this).val();
	var data2=$('#changeradio').val(); 
	if(data.length>=2){
		$.ajax({
			url:"<c:url value='/reg/stunocheck'/>",
			type:"post",
			data:{"stu_no":data,"chk_info":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#checkstuno').html("회원 확인이 되셨습니다.").css("color", "blue");
					$('#chkstu').val('Y').css("color","red");
				}else{
					$('#checkstuno').html("회원번호를 다시 입력해 주세요").css("color", "red");
					$('#chkstu').val('N');
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});		
		
		
		
		$.ajax({
			url:"<c:url value='/reg/registercheck'/>",
			type:"post",
			data:{"stu_no":data,"chk_info":data2},
			success:function(res){
				//alert(res);
				if(res){
					$('#checkalready').val('Y').css("color","red");//못써먹음
				}else{
					$('#checkalready').val('N');
				}
			},
			error:function(xhr, status, error){
				alert("error 발생!!" + error);
			}
		});		
		
		
		
		
		
	}else{
		$('#checkstuno').text('입력이 짧거나 쓸 수 없는 문자가 있습니다.').css("color", "brown");
		
	}
});

//radio를 바꿨을 때 체크 값 변경
$("input:radio[name=chk_info]").change(function(){
	var data=$(this).val(); 
	$('#stuno').val('');
	$('#chkstu').val('');
	$('#checkstuno').html("");
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


});	


</script>



<div class="reg_box">
<div class="container">
<div>
	<article class="align_center">
		<form name="register" method="post" action="<c:url value='/reg/register'/>">
			<fieldset>
				<br>
				<div class="text-center">
					<h4>회원인증</h4>
				<br>
				
				<input type="radio" name="chk_info" value="student">학생
				<input type="radio" name="chk_info" value="admin">관리자 
				<input type="radio" name="chk_info" value="professor">교수
				<br><br>
				<!-- 학번인증 -->
				<input type="text"	class="stuno form-control" id="stuno" name="stuno" placeholder="회원번호를 입력하세요" required
						style="ime-mode: inactive"> 
						<div class="checkstuno" id="checkstuno"></div>
					<br>
				<div class="center"></div>
				<br>
				<span>
					<input type="submit" id="register" class="btn btn-dark" value="회원가입" >
					<input type="button" id="return" class="btn btn-dark" value="나가기">
				</span>
				</div>
			</fieldset>
			
			   <input type ="hidden" name="chkstu" id="chkstu">
			   <input type ="hidden" name="changeradio" id="changeradio">
			     <input type ="hidden" name="checkalready" id="checkalready">
			   

		</form>
	</article>
	</div>
	
</div>
</div>




<%@ include file="../inc/bottom.jsp"%>
