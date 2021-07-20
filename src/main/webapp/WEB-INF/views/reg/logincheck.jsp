<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 확인용</title>
</head>
<body>
<%
	//로그인 정보가 없으면 들어갈 수 없는 곳이 있을 때 만든다. 
	String Id = (String)session.getAttribute("user_id");
	if(Id ==null|| Id.isEmpty()){%>
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath()%>/reg/login.jsp"
		</script>
		
		<% 
	}
%>

</body>
</html>