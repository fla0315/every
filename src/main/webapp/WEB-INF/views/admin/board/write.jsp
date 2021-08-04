<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article>
		
	<h3 class="name">익명</h3>
	<ul>
		<li class="message">쪽지</li>
		<li class="abuse">신고</li>
	</ul>
	
	<h2 class="title">내가 하고 싶은 거</h2>
	<pre>
		도망가는 거. 놀러가는 거. 속 편히 노는 거.
	</pre>
	
	<ul class="status left">
		<li title="vote"></li>
		<li title="스크랩"></li> 
	</ul>
	<form class="writecomment">
		<input type="text" name="comment" maxlength="300" autocomplete="off" placeholder="댓글을 입력하세요." class="text">
		<ul class="option">
			<li title="private" class="private">
			<li title="submit" class="submit">
		</ul>
	</form>
	</article>

</body>
</html>