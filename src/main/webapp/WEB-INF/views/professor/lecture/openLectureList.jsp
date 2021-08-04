<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script type="text/javascript">
	$(function(){	//개설과목 학생성적조회
		$('#btCheck').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/evaluation/evaluationRecord?openSubCode="+openSubCode+"'/>";
			} else{
				alert('개설교과목 번호를 선택하세요!');
			}
		});
	
		$('input[name=chkAll]').change(function(){
			$('.card-body table tbody input[type=checkbox]').prop('checked', this.checked);
		});
	});
</script>

<style type="text/css">
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
	<article>
		<div class="container col-lg-10" role="main">
			<h2>담당 개설교과목</h2>
				<br>
				<div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-table me-1"></i>
                       개설 강의 목록
                   </div>
                   <div class="card-body">
                       <table id="datatablesSimple">
                           <thead>
                               <tr>
                               	<th>개설교과목번호</th>
                                <th>과목명</th>
                                <th>이수구분</th>
                                <th>등록인원</th>
                                <th>최대인원</th>
                                <th>개설일자</th>
                                <th>폐지일자</th>
                               </tr>
                           </thead>
                           <tbody>
                               <c:if test="${empty oList }">
                               	<tr>
                               		<td colspan="7" class="text-center">등록된 강의가 없습니다.</td>
                               	</tr>
                               </c:if>
                               <c:if test="${!empty oList }">
                               	<c:forEach var="map" items="${oList }">
                               		<tr>
                               			<td>${map['OPEN_SUB_CODE'] }</td>
                               			<td>${map['SUBJ_NAME'] }</td>
                               			<td>${map['TYPE'] }</td>
                               			<td>${map['STUDENT'] }</td>
                               			<td>${map['PERSONNEL'] }</td>
                               			<td><fmt:formatDate value="${map['OPEN_DATE'] }" pattern="yyyy-MM-dd"/></td>
                               			<td><fmt:formatDate value="${map['CLOSE_DATE'] }" pattern="yyyy-MM-dd"/></td>
                               			</tr>
                               	</c:forEach>
                               </c:if>
                           </tbody>
                       </table>
                   </div>
               </div>
		</div>
	</article>

<%@ include file="../../inc/bottom.jsp" %>
