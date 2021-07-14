<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/resources/bootstrap.css">
	<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
	    }
	
	</style>
	<script type="text/javascript">
	$(function loginchat(){ 
		$("form").submit();
		});

	</script>
	<title>Home</title>
</head>


  <form id="login-form" method="post" action="/loginProcess.do">
  
    <input type="hidden" class="form-control" name="traveler_chat_nm" value="${sessionScope.loginId }" readOnly>
    
    <input type="hidden" class="form-control" name="chat_nm" value="${list}" readOnly>
    
    <input type="hidden" class="form-control" name="upboard_nm" value="${list}" readOnly>
    
   
   </form>

</html>
