<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="inc/top.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">

			$(function() {
				$("#user_id").on('keyup', idcheck);
			});
			
			function idcheck(){
				var user_id = $("#user_id").val();
				$.ajax({
					url : "<c:url value='/idCheck'/>",
					type : 'POST',
					data : user_id,
					dataType : "json",
					success : function(data) {
						if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#id_check").text("사용중인 아이디입니다");
							$("#id_check").css("color", "red");
						} else {
							$("#id_check").text("사용가능한 아이디입니다");
						
						}
					}
				});
			});
</script>
</head>

<body>
	<div>
		<article class="align_center">
			<form name="register" method="post" action="/register">
				<fieldset>
					<legend>회원 가입</legend>
					<!-- 아이디 -->
					<div class="id" style="width: 200px;">
						<label for="user_id">아이디</label>
							<br> 
							<input type="text" class="form" id="user_id" name="user_id" placeholder="ID" required>
						<div class="check_id" id="id_check"></div>
					</div>
						<br>
						
					<!-- 비밀번호 -->
					<div class="pwd" style="width: 200px;">
						<label for="pwd">비밀번호</label>
							<br> 
							<input type="text" class="form" 
							id="pwd" name="pwd" placeholder="password" required>
						<div class="check_pwd" id="pwd_check"></div>
					</div>
						<br>
						
						<!-- 비밀번호 확인용 -->
					<div class="pwd2" style="width: 200px;">
						<label for="pwd">비밀번호 확인</label>
							<br> 
							<input type="text" class="form" 
							id="pwd2" name="pwd2" placeholder="password" required>
						<div class="check_pwd2" id="pwd2_check"></div>
					</div>
						<br>
					
					<!-- 이메일 -->
					<div class="email" style="width: 400px;">
						<label for="em">이메일</label> 
							<br>
							<input type="text" class="form" 
							id="email1" name="email1" placeholder="E-MAIL" required>
						
						<span class="@" id="@">@</span> 
					
					<select	class="input" name="email2" id="email2">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
						<div class="check_email" id="email_check"></div>
					</div>
					<br>
					
					<!-- 휴대폰 -->
					<div class="phone">
						<label for="ph">휴대폰</label> 
							<br>
						<span>
					<input type="text" class="form"	id="pwd1" name="email1" style="width: 80px;">&nbsp;-
					<input type="text" class="form"	id="pwd2" name="email1" style="width: 80px;">&nbsp;-
					<input type="text" class="form" id="pwd3" name="email1" style="width: 80px;">
							
						<div class="check_phone" id="phone_check"></div>
						</span>
					</div>
						<br>
					
					<div class="center"></div>
					<input type="submit" id="submit" value="회원가입" style="width: 120; height=25px;">
					
					</fieldset>
					</form>
					</article>
					
					

				

				</div>
				
				

				</fieldset>
			</form>
		</article>
	</div>

</body>

<%@ include file="inc/bottom.jsp"%>
