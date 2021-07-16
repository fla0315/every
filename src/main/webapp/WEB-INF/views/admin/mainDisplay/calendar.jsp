<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<h1 class="mt-4">학사일정</h1>

	<div class="col-xl-6" style="float: left; width: 450px; margin: 20px">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area me-1"></i> 학사일정
			</div>
			<script type="text/javascript"
				src="<c:url value='/resources/js/calendar.js'/>"></script>
			<div id="calendar" style="float: left; width: 100%"></div>
		</div>
	</div>
	<div class="card-body" style="float: right; width: 820px">
			<table id="datatablesSimple">
				<colgroup>
					  <col style="width:8%;" />
					  <col style="width:42%;" />
					  <col style="width:15%;" />
					  <col style="width:15%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
					  
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>성적조회기간</td>
						<td>2021-07-02</td>
						<td>2021-07-23</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>2</td>
						<td>고지서출력기간(신입생)</td>
						<td>2021-07-05</td>
						<td>2021-08-27</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>3</td>
						<td>수업계획서 강의(시험)유형 입력기간</td>
						<td>2021-07-09</td>
						<td>2021-08-09</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>4</td>
						<td>최종성적확정일</td>
						<td>2021-07-13</td>
						<td>2021-07-13</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>5</td>
						<td>[여름계절수업]성적입력(정정)기간</td>
						<td>2021-07-16</td>
						<td>2021-07-27</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
				</tbody>
			</table>
		</div>


<%@ include file="../../inc/bottom.jsp" %>  