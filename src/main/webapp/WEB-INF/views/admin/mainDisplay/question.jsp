<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-clipboard-list"></i>&nbsp;Q&amp;A게시판
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
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">작성일</th>
						<th style="text-align: center">답글</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td style="vertical-align: middle"><a href="#">질문이요~!!</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/14</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-success btn-sm" value="답글"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">2</td>
						<td style="vertical-align: middle"><a href="#">등록금 관련 질문합니다</a></td>
						<td style="vertical-align: middle; text-align: center;">심길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/13</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-success btn-sm" value="답글"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">3</td>
						<td style="vertical-align: middle"><a href="#">기숙사관련 질문드려요</a></td>
						<td style="vertical-align: middle; text-align: center;">최길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/11</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-success btn-sm" value="답글"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">4</td>
						<td style="vertical-align: middle"><a href="#">방학 중 강의실 사용질문</a></td>
						<td style="vertical-align: middle; text-align: center;">양길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/08</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-success btn-sm" value="답글"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">5</td>
						<td style="vertical-align: middle"><a href="#">안녕하세요. 질문있습니다!</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/02</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-success btn-sm" value="답글"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>

<%@ include file="../../inc/bottom.jsp" %>