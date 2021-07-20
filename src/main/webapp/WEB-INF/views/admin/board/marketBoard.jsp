<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-clipboard-list"></i>&nbsp;거래게시판
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
						<td style="vertical-align: middle; text-align: center;">4</td>
						<td style="vertical-align: middle"><a href="#">광고성 게시글*광고성 게시글*광고성 게시글</a></td>
						<td style="vertical-align: middle; text-align: center;">양길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/17</td>
						<td style="vertical-align: middle; text-align: center;">17</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">3</td>
						<td><a href="#">*초보 웹 개발자를 위한 스프링5 프로그래밍입문* 저렴하게 판매합니다</a></td>
						<td style="vertical-align: middle; text-align: center;">홍길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/07/08</td>
						<td style="vertical-align: middle; text-align: center;">5</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">2</td>
						<td><a href="#">'Do it! 오라클로 배우는 데이터베이스 입문'책 구합니다</a></td>
						<td style="vertical-align: middle; text-align: center;">김길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/06/28</td>
						<td style="vertical-align: middle; text-align: center;">8</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;">1</td>
						<td><a href="#">혼공자 자바교재 새제품 판매합니다~</a></td>
						<td style="vertical-align: middle; text-align: center;">고길동</td>
						<td style="vertical-align: middle; text-align: center;">2021/06/23</td>
						<td style="vertical-align: middle; text-align: center;">3</td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-primary btn-sm" value="수정"></td>
						<td style="vertical-align: middle; text-align: center;"><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

<%@ include file="../../inc/bottom.jsp" %>