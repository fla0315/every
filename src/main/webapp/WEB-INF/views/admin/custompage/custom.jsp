<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
	<script type="text/javascript">
	
	$('#addpage').click(function(){
    	  //누르면 창이 떠오르는 형태로
		  var chk_nick = $('#mbNick').val();
    	  window.open("checkMbNick.jsp?chk_nick="+chk_nick, "chk", "top=0, left=0, width=400, height=300, location=yes, resizable=yes");
    	  <a href="<c:url value='/admin/custom/customPage2'/>">
	});
    
	
	</script>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 임직원목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과/부서</th>
						<th style="text-align: center">사번</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">직책</th>
						<th style="text-align: center">권한</th>
						<th style="text-align: center">입사년도</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center;">대학본부</td>
						<td style="vertical-align: middle; text-align: center;">00000001</td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">부장</td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2008</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">입학관리처</td>
						<td style="vertical-align: middle; text-align: center;">00000037</td>
						<td style="vertical-align: middle; text-align: center;">홍길용</td>
						<td style="vertical-align: middle; text-align: center;">대리</td>
						<td style="vertical-align: middle; text-align: center;">부관리자</td>
						<td style="vertical-align: middle; text-align: center;">2015</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">행정처</td>
						<td style="vertical-align: middle; text-align: center;">00000048</td>
						<td style="vertical-align: middle; text-align: center;">홍길순</td>
						<td style="vertical-align: middle; text-align: center;">주임</td>
						<td style="vertical-align: middle; text-align: center;">부관리자</td>
						<td style="vertical-align: middle; text-align: center;">2019</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">경영학부</td>
						<td style="vertical-align: middle; text-align: center;">00000005</td>
						<td style="vertical-align: middle; text-align: center;">홍길자</td>
						<td style="vertical-align: middle; text-align: center;">사원</td>
						<td style="vertical-align: middle; text-align: center;">스태프</td>
						<td style="vertical-align: middle; text-align: center;">2020</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeEdit'/>">
								<button class="btn btn-primary btn-sm">
									수정
								</button>
							</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="<c:url value='/admin/employee/employeeDelete'/>">
								<button class="btn btn-danger btn-sm">
									삭제
								</button>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/custom/customPage'/>">
				<button class="btn btn-primary btn-sm">
					직원등록
				</button>
				</a>
			</div>
			<div style="text-align: right; margin-right: 30px">
				<button class="btn btn-primary btn-sm" id="addpage">
					게시판등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>