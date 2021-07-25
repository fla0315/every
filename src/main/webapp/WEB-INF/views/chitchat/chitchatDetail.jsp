<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받는 사람 검색</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/> "></script>
<script type="text/javascript">

</script>
<style type="text/css">
	#notice{
		font-size : 0.8em;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>
<div class="card-header">
	<i class="fas fa-envelope"></i> 쪽지
</div>
<div class="card-body">
		<form name="frm" method="post"
			action="<c:url value=''/>">
			<div class="form-floating mb-3">
				<input type="hidden" name="msgNo" value="${map['MSG_NO'] }" />
				<input type="hidden" name="flag" value="${map['KEEP_FLAG'] }" />
				<input type="hidden" name="detail" value="detail">
				<label>보낸 사람 : </label>
				<input class="" name="officialName" id="name"
									type="text" value="${map['OFFICIAL_NAME'] }" readonly size="10">
				<label>&nbsp;&nbsp;받는 사람 : </label>
				<input class="" name="officialName" id="name"
									type="text" value="${map['RECEIVERNAME'] }" readonly size="10">
			</div>
		<div class="form-floating mb-3">
			<textarea class="col-md-12" rows="10" cols="20" wrap="hard" name="contents">${map['CONTENTS'] }</textarea>
		</div>
		<div class="mt-4 mb-0">
			<div class="d-grid text-center">
				<c:if test="${sessionScope.name != map['OFFICIAL_NAME'] }">
					<c:if test="${map['KEEP_FLAG']=='Y' }">
					<input class="btn btn-danger" type="submit" value="취소" formaction="<c:url value='/chitchat/storage'/>">
					</c:if>
					<c:if test="${map['KEEP_FLAG']=='N' }">
					<input class="btn btn-success" type="submit" value="보관" formaction="<c:url value='/chitchat/storage'/>">
					</c:if>
				</c:if>
				<input type="submit" class="btn btn-primary" value="삭제">
			</div>
		</div>
	</form>
</div>
</body>
</html>