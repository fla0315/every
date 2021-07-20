<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 교수목록
		</div>
		<div class="card-body">
			
			
			
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>학부</th>
						<th>학과</th>
						<th>교번(?)</th>
						<th>이름</th>
						<th>직책</th>
						<th>부임년도</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>000001</td>
						<td>김길동</td>
						<td>정교수</td>
						<td>2015</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>000002</td>
						<td>정길동</td>
						<td>부교수</td>
						<td>2019</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>000003</td>
						<td>이길동</td>
						<td>정교수</td>
						<td>2014</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>000004</td>
						<td>유길동</td>
						<td>정교수</td>
						<td>2008</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td>OO학부</td>
						<td>OO학과</td>
						<td>000005</td>
						<td>고길동</td>
						<td>부교수</td>
						<td>2017</td>
						<td><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/professor/professorRegister'/>">
				<button class="btn btn-primary btn-sm">
					교수등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>