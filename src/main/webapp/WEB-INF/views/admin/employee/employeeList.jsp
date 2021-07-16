<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 임직원목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>학과/부서</th>
						<th>사번</th>
						<th>이름</th>
						<th>직책</th>
						<th>권한</th>
						<th>입사년도</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>대학본부</td>
						<td>00000001</td>
						<td>홍길동</td>
						<td>부장</td>
						<td>관리자</td>
						<td>2008</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>입학관리처</td>
						<td>00000037</td>
						<td>홍길용</td>
						<td>대리</td>
						<td>부관리자</td>
						<td>2015</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>행정처</td>
						<td>00000048</td>
						<td>홍길순</td>
						<td>주임</td>
						<td>부관리자</td>
						<td>2019</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>경영학부</td>
						<td>00000005</td>
						<td>홍길자</td>
						<td>사원</td>
						<td>스태프</td>
						<td>2020</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/employee/employeeRegister'/>">
				<button class="btn btn-primary btn-sm">
					직원등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>