<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



	<%
	String no = (String)session.getAttribute("no");
	String usertype = (String)session.getAttribute("usertype");
	%>
	
	<%if(usertype.equals("professor")){ %>
	<jsp:include page="../../../inc/prof_top.jsp"></jsp:include>
	<%}else if(usertype.equals("admin")){ %>
		<jsp:include page="../../../inc/admin_top.jsp"></jsp:include>
		<%}else if(usertype.equals("student")){ %>
		<jsp:include page="../../../inc/student_top.jsp"></jsp:include>
		<%} %>

	

<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">



<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	$(function() {
		
		var type='<%=(String)session.getAttribute("usertype")%>';
		var no='<%=(String)session.getAttribute("no")%>';
		
		if ($('#confirm').val() == "") {
			$('#writecalom').hide();

		}
		
		if ($('.code').val()!=no) {
			$('#delete').hide();
		}
		
		
		
		var type='<%=(String)session.getAttribute("usertype")%>';
		var no='<%=(String)session.getAttribute("no")%>';

		
		//답글 달리면 수정 안되지.
		if ($('.codeinput').val()!=no || $('.id').val()!=null) {
			$('.changeall').hide();
		}
		
		$('.changeall').click(function(){
			var title=$('.title').val();
			var change="c";
			var postno2= $('#postNo2').val();
		
			  window.open("write?title="+title+"&change="+change+"&postno="+postno2, "chk", "width=850, height=500, resizable=no"); 
			
		});
		
		$('#comment').keyup(function(e) {
			var content = $(this).val();
			if (content.length > 100) {
				$(this).val($(this).val().substring(0, 100));
				alert("입력은 100자까지만 가능합니다.");
				event.preventDefault();
			}
		});

		$('#showrite').click(function() {
			$('#confirm').val("Y");
			$('#writecalom').show();

		});
		$('#replyclose').click(function() {
			$('#confirm').val("");
			$('#writecalom').hide();

		});
		
		
//댓글달기
		$('#replysubmit').click(function() {
			alert("전송중");
			var comment = $('#comment').val();
			var postNo = $('#postNo').val();

			$.ajax({
				type : "post",
				url : '<c:url value='/reply/insert'/>',
				data : {
					"comment" : comment,
					"postNo" : postNo
				},
				async : false,
				success : function(res) {
					if (res) {
						alert("등록성공");
						location.reload();
					} else {
						alert("등록실패");
					}

				},
				error : function(xhr, status, error) {
					alert("error 발생!!" + error);
					location.reload();
				}
			});

		});

		//좋아요 선택 옵션
		$('#score_nm a').click(function() {
			$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
			$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			
			var val = $(this).attr("id");
			var postNo = $('#postNo').val();
			
			$.ajax({
				type : "post",
				url : '<c:url value='/reply/good'/>',
				data : {
					"val":val,
					"postNo":postNo
					},
				async : false,
				success : function(res) {
					if (res) {
						alert("성공");
					} else {
						alert("실패");
					}

				},
				error : function(xhr, status, error) {
					alert("error 발생!!" + error);
					
				}
			});
			
		});
		
		//좋아요 눌렀으면 아예 못 바꾸게 하자.
		if ($('#good').val()==1) {
				$('#score_nm a').addClass("on").prevAll("a").addClass("on");
		}
		

		//작성자 다르면 못 지운다.

		$('.writetext #delete').click(function() {
			var name='<%=(String)session.getAttribute("name")%>';
			var userno='<%=(String)session.getAttribute("no")%>';
			var del = $(this).val();
			var no = $(this).next().next().val();
			var writeno= $(this).prev().val();
			
			if (userno!=writeno) {
				alert("자신의 글만을 삭제하실 수 있습니다.");
				event.preventDefault();	
				
			}else{
			
			
			$.ajax({
				type : "post",
				url : '<c:url value='/reply/deletereply'/>',
				data : "writeno="+no,
				async : false,
				success : function(res) {
					if (res) {
						location.reload();
					} else {
						alert("삭제실패");
					}

				},
				error : function(xhr, status, error) {
					alert("error 발생!!" + error);
					location.reload();
				}
			});
			}
		});
		

	});
</script>
<style type="text/css">
body {
	padding: 5px;
	margin: 5px;
}

.divForm {
	margin: 0 auto;
	width: 500px;
	height: auto;
}

.reg_box {
	border: 1px solid #cce1e4;
	border-radius: 30px;
	margin: 5% auto;
	padding: 30px;
	height: auto;
	width: 600px;
	background-color: rgba(255, 255, 255, 0.8);
}

.col-md-8 border {
	margin: 100px auto;
	padding: 10px;
	width: 600px;
}

.writetext {
	background: #66abe654;
	padding: 5px 10px 16px 10px;
	border-radius: 5px;
	height: auto;
	width: 470px;
}

p {
	text-align: justify;
	word-wrap: break-word;
}

pre{
	text-align: justify;
	word-wrap: break-word;
}

img {
	max-width: 300px;
}

#score_nm a {
	text-decoration: none;
	color: #e2e2e2;
	font-size: 32px;
	padding: 5px;
    margin: 0;
}

#score_nm a.on {
	color: #ff9c07;
}


.anime__details__rating {
	text-align: center;
	position: absolute;
	right: 30px;
}

.anime__details__rating span {
	/* display: block; */
	display:inline;
	font-size: 18px;
	color: #131416;
}

.btn-danger{
	color: #fff;
    background-color: #3545dc;
    border-color: #6cdc35;
}

.container{
	height: auto;
}


</style>

</head>
<body>
	<div>
		<div class="reg_box">
			<div class="container" style="position: relative">

				<div class="divForm">


					<c:forEach var="vo" items="${list}">
					<input type="hidden" class="title" value="${vo.title}">
					<input type="hidden" class="postNo2" id="postNo2" value="${vo.postNo}">
					<h5>${vo.title}</h5>
					   <!--   <div class="anime__details__rating">
	                                    <p id="score_nm"> 
										        <a href="#score_nm" class="bi bi-hand-thumbs-up" id="1"></a>
										        	       
										</p>
		                            </div>
		                            -->
						<br>
						
					
						
              

						<div class="date">
							<fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" />
						</div>

						<br>

					
							<div class="contect" style="width:400px; float:left;">${vo.contents}</div>
							
							<input type="hidden" value="${vo.isPrivate}">
							<input type="hidden" class="codeinput" value="${vo.writerCode}">
					

					</c:forEach>
				
			
			

				<!-- <a href='reply.jsp'>답변</a> |
			<a href='QAlist.jsp'>목록</a> |
				<a href='QAlist.jsp'>신고</a>  -->
	
				<input type="button" class="changeall" style="float:left" value="수정">
			<span class="몰라" style="float:right">
				<input type="button" class="btn btn-danger btn-sm" id="showrite"
					value="답변" > 
					
					
				<input type="button"
					class="btn btn-danger btn-sm" id="call" value="신고하기"  >
					</span>
				<br>
					<br>
		
		</div>
		</div>
		</div>
		<div class="writecalom" id="writecalom">
			<div class="reg_box">
				<!-- 답변 누르면  -->


				<pre>
			<textarea rows="5" name="comment" id="comment" class="form-control"
						autocomplete="off" wrap="hard"
						style="height: 150px; width: 450px;"
						placeholder="내용을 입력하세요.&#13;&#10;입력하신 글은&#13;&#10;운영정책에 따라 삭제될 수도 있습니다."></textarea>
			</pre>

				<input type="button" class="btn btn-danger btn-sm" id="replysubmit"
					value="제출하기"> <input type="button"
					class="btn btn-danger btn-sm" id="replyclose" value="닫기">
			</div>
		</div>
		<input type="hidden" id="confirm">
		<!-- 글번호 저장용 -->
		<input type="hidden" id="postNo" value='${param.postNo}'>

		<div class="reg_box">
			<div class="container">
				<div>
					<c:if test="${empty list2 }">
						<div>
							<div>등록된 댓글이 없습니다.</div>
						</div>
					</c:if>
					<c:if test="${!empty list2 }">
						<c:forEach var="map" items="${list2}">
							<article class="align_center">

								<fieldset>
									<br>

									<div class="writetext" style="position: relative">
									<%String id=(String)session.getAttribute("user_id");%>	
										<div class="id"><!-- ${map['USERNAME']} -->
										<span class="writdate" style="float: right">
											<fmt:formatDate value="${map['REG_DATE']}" pattern="yyyy-MM-dd" />
										</span>
										</div>
										<br>										
								
										<div class="writecon">
											<p>${map['CONTENTS']}</p>
										</div>
										<input type="hidden" class="code" value="${map['WRITER_CODE']}">
										
									
												<button class="btn btn-danger btn-sm"  id="delete" value="">삭제</button>
								
												<button class="btn btn-danger btn-sm"  id="call" value="">신고</button>
											
									
										<input type="hidden" id="no" class="no" value="${map['REPLY_NO']}">


									</div>
									<br> <br>

								</fieldset>


							</article>
						</c:forEach>
					</c:if>


				</div>

			</div>
		</div>
	</div>

</body>
</html>


<%@ include file="../../../inc/bottom.jsp"%>