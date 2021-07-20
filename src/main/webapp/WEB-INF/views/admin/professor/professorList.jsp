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
						<th style="text-align: center">학부</th>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">교수번호</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">직책</th>
						<th style="text-align: center">부임년도</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center;">OO학부</td>
						<td style="vertical-align: middle; text-align: center;">OO학과</td>
						<td style="vertical-align: middle; text-align: center;">000001</td>
						<td style="vertical-align: middle; text-align: center;">김길동</td>
						<td style="vertical-align: middle; text-align: center;">정교수</td>
						<td style="vertical-align: middle; text-align: center;">2015</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">OO학부</td>
						<td style="vertical-align: middle; text-align: center;">OO학과</td>
						<td style="vertical-align: middle; text-align: center;">000002</td>
						<td style="vertical-align: middle; text-align: center;">정길동</td>
						<td style="vertical-align: middle; text-align: center;">부교수</td>
						<td style="vertical-align: middle; text-align: center;">2019</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">OO학부</td>
						<td style="vertical-align: middle; text-align: center;">OO학과</td>
						<td style="vertical-align: middle; text-align: center;">000003</td>
						<td style="vertical-align: middle; text-align: center;">이길동</td>
						<td style="vertical-align: middle; text-align: center;">정교수</td>
						<td style="vertical-align: middle; text-align: center;">2014</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">OO학부</td>
						<td style="vertical-align: middle; text-align: center;">OO학과</td>
						<td style="vertical-align: middle; text-align: center;">000004</td>
						<td style="vertical-align: middle; text-align: center;">유길동</td>
						<td style="vertical-align: middle; text-align: center;">정교수</td>
						<td style="vertical-align: middle; text-align: center;">2008</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">OO학부</td>
						<td style="vertical-align: middle; text-align: center;">OO학과</td>
						<td style="vertical-align: middle; text-align: center;">000005</td>
						<td style="vertical-align: middle; text-align: center;">고길동</td>
						<td style="vertical-align: middle; text-align: center;">부교수</td>
						<td style="vertical-align: middle; text-align: center;">2017</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/professor/professorDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
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