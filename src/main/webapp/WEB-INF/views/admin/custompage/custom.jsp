<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@ include file="../../inc/admin_top.jsp" %>



<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
	
	<script type="text/javascript">
$(function() {
	$('#addpage').click(function(){
    	  //누르면 창이 떠오르는 형태로(추가시에)		
    	  window.open("custompage2", "chk", "width=800, height=500, resizable=no"); 
	});
	
	$('#changepage').click(function(){
  	  //누르면 창이 떠오르는 형태로(변경시에)	
  	   var change=$('.confirm').val();
  	  if (change=="") {
		alert("수정할 제목을 선택해주세요.");
		event.preventDefault();
	}else{ 
  	  window.open("custompagechange?change="+change, "change", "width=500, height=250, resizable=no"); 
	}
	});
	
	$('.checkoption').change(function(){
		var con= $(this).parent().prev().prev().prev().prev().prev().prev().text();
		
		console.log(con);
		$('#confirm').val(con);
		
	});
    
});
	</script>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 게시판 목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">이수구분</th>
						<th style="text-align: center">강좌명</th>
						<th style="text-align: center">댓글</th>
						<th style="text-align: center">비공개</th>
						<th style="text-align: center">업로드</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
						
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list}">
						<tr>
							<td colspan="8" style="text-align: center">등록된 게시판이 없습니다.</td>
						</tr>
					</c:if>
				
					<c:forEach var="vo" items="${list}">          
					
					<tr>
						<td style="vertical-align: middle; text-align: center;">${vo.deptname}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.bdname}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.type}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.subjname}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.isreply}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.isprivate}</td>
						<td style="vertical-align: middle; text-align: center;">${vo.isupload}</td>
						<td style="vertical-align: middle; text-align: center;">
								<input type=radio class="checkoption" name="checkoption">	
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/custompage/custompageDelete?deletename=${vo.bdname}'/>" 
									class="btnDel">
									<button class="btn btn-danger btn-sm" >
										삭제
									</button>
								</a>
							</td>
					</tr>
					</c:forEach>
				
				</tbody>
			</table>
			<br>
			<div style="text-align: right; margin-right: 30px">
				<button class="btn btn-primary btn-sm" id="addpage" class="addpage">
					게시판등록
				</button>
				
				<button class="btn btn-primary btn-sm"  id="changepage" class="changepage" name="changepage">
					수정
				</button>
				
				<button class="btn btn-primary btn-sm" id="deleteboard" class="deleteboard">
					삭제
				</button>
				<input type="hidden" id="confirm" class="confirm">
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>