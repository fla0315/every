<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#userid').keyup(function() {
			var data = $('#userid').val();
			if (validate_userid(data) && data.length >= 2) {
				data = 'userid=' + data;
				$.ajax({
					type : "POST",
					url : "<c:url value='/member/ajaxCheckId.do' />",
					data : data,
					success : function(result) {
						if (result) {
							output = "이미 등록된 아이디";
							$("#chkId").val('N');
						} else {
							output = "사용가능한 아이디";
							$("#chkId").val('Y');
						}
						$('#message').text(output);
					}
				});
			} else {
				$('#message').text("아이디 규칙에 맞지 않습니다");
				$("#chkId").val('N');
			}
		});
	});
	65
	function validate_userid(uid) {
		var pattern = new RegExp(/^[a-z0-9_]+$/g);
		return pattern.test(uid);
	}
</script>
</head>
<body>
	<p>
		<label for="userid">회원ID</label> <input type="text" name="userid"
			id="userid">
		<!--<input type="button" value="중복확인" name="btnChkId"
onclick="useridCheck()" title="새창열림"> -->
		<span id="message"></span>
		<form:errors path="userid" />
	</p>
	<input type="hidden" name="chkId" id="chkId">

</body>
</html>