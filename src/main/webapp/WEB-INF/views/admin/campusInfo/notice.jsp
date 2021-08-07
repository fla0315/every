<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-clipboard-list"></i>&nbsp;공지사항
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<colgroup>
					  <col style="width:5%;" />
					  <col style="width:40%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
					  <col style="width:5%;" />
					  <col style="width:5%;" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">작성일</th>
						<th style="text-align: center">조회수</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">홈페이지 개편 이벤트 안내</a></td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/14</td>
						<td style="vertical-align: middle; text-align: center;">57</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">2</td>
						<td style="vertical-align: middle"><a href="#">2021학년도 제2학기 수강신청 안내</a></td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/13</td>
						<td style="vertical-align: middle; text-align: center;">249</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">3</td>
						<td style="vertical-align: middle"><a href="#">학부생 주차 일일권요금 적용 신청 안내</a></td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/11</td>
						<td style="vertical-align: middle; text-align: center;">41</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">4</td>
						<td style="vertical-align: middle"><a href="#">대학행정정보시스템 파일업로드 관련 안내</a></td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/08</td>
						<td style="vertical-align: middle; text-align: center;">73</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">5</td>
						<td style="vertical-align: middle"><a href="#">2021년 2학기 학자금대출 사업 안내</a></td>
						<td style="vertical-align: middle; text-align: center;">관리자</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/02</td>
						<td style="vertical-align: middle; text-align: center;">128</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/mainDisplay/noticeWrite'/>">
					<button class="btn btn-primary btn-sm">공지사항작성</button>
				</a>
		</div>
	</div>
	

<%@ include file="../../inc/bottom.jsp" %>