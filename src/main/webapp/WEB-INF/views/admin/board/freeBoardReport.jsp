<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<h1 class="mt-4">신고글 관리</h1>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>신고글 관리
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<colgroup>
					  <col style="width:10%;" />
					  <col style="width:40%;" />
					  <col style="width:15%;" />
					  <col style="width:15%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>컴공 자바기초강의 수업 어떤가요??</td>
						<td>홍길동</td>
						<td>2021/03/14</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>

<%@ include file="../../inc/bottom.jsp" %>