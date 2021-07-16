<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 학생목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>학부</th>
						<th>학과</th>
						<th>학번</th>
						<th>이름</th>
						<th>입학년도</th>
						<th>학적상태</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>20210001</td>
						<td>홍길동</td>
						<td>2021</td>
						<td>재학생</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>20180013</td>
						<td>오길동</td>
						<td>2018</td>
						<td>재학생</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>20200034</td>
						<td>배길동</td>
						<td>2020</td>
						<td>휴학생</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>20100048</td>
						<td>마길동</td>
						<td>2010</td>
						<td>졸업생</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>20210017</td>
						<td>김길동</td>
						<td>2021</td>
						<td>재학생</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/student/studentRegister'/>">
				<button class="btn btn-primary btn-sm">
					학생등록
				</button>
				</a>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>