<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp"%>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.ccdetail a {
	color:black;
}

.ccdetail a:hover{
	color:gray;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#btnSearch').click(function(){
			//새창 띄우기
			window.open("${pageContext.request.contextPath }/chitchat/searchReceiver", "search", "top=0, left=0, width=500, height=500, location=yes, resizable=yes");
	    });
		
		$('#btSend').click(function(){
			if($('#receiver').val().length<1){
				alert("받을 사람을 입력하세요");
				$('#btSearch').focus();
				event.preventDefault();
				return false;
			} else if($('#taContents').val().length<1){
				alert("내용을 입력하세요");
				$('#taContents').focus();
				event.preventDefault();
				return false;
			}
			
		});
	});
</script>
<article>
	<div class="container col-lg-10" role="main">
				<div class="row">
				<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-envelope"></i> 발송하기
					</div>
					<div class="card-body" style="height:450px">
						<form name="frm" method="post"
							action="<c:url value=''/>">
							<div class="row mb-3">
								<div class="col-md-5">
									<div class="form-floating">
										<input class="form-control" name="officialName" id="name"
											type="text" value="${sessionScope.name }" readonly/> <label
											for="name">보내는 사람</label>
										<input type="hidden" name="officialNo" value="${sessionScope.no }"> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-floating mb-3 mb-md-0">
										<input class="form-control" name="receiver" type="text" id="receiver"
											value=""/ readonly> <label for="receiver">받는 사람</label>
											<input type="hidden" value="" id="code" name="code">
									</div>
								</div>
								<div class="col-md-2">
									<input type="button" class="btn btn-secondary btn-block" id="btnSearch" value="조회" style="height:55px">
								</div>
							</div>
							<div class="form-floating mb-3">
								<textarea class="col-md-12" rows="10" cols="20" wrap="hard" name="contents" id="taContents"></textarea>
							</div>
							<div class="mt-4 mb-0">
								<div class="d-grid">
									<input type="submit" id="btSend" class="btn btn-primary btn-block" value="발송하기">
								</div>
							</div>
						</form>
					</div>
				</div>
				</div>
					<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-envelope-square"></i> 전체보기
						</div>
						<div class="card-body" style="height:450px">
							<table class="table-bordered text-center" style="width: 100%">
								<colgroup>
									<col style="width: 10%" />
									<col style="width: 10%" />
									<col style="width: 50%" />
									<col style="width: 30%" />
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" name="chkAll"></th>
										<th></th>
										<th>내용</th>
										<th>보낸 사람</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="4">데이터가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
											<c:if test="${empty map['DEL_FLAG'] }">
											<tr>
												<td><input type="checkbox">
												<td>
													<c:if test="${map['OFFICIAL_NO'] eq no }">
														<i class="fas fa-envelope"></i>
													</c:if>
													<c:if test="${!(map['OFFICIAL_NO'] eq no) }">
														<i class="far fa-envelope"></i>
													</c:if>
												</td>
												<td class="ccdetail text-left">&nbsp;
												<a href="#" onclick="window.open('${pageContext.request.contextPath }/chitchat/chitchatDetail?msgNo=${map['MSG_NO'] }&readDate=${map['READ_DATE'] }', 'detail', 'top=100, left=600, width=500, height=500, location=yes, resizable=yes')">${map['CONTENTS'] }</a></td>
												<td>
												<c:if test="${map['OFFICIAL_NO'] eq no }">
														나
												</c:if>
												<c:if test="${!(map['OFFICIAL_NO'] eq no) }">
													${map['OFFICIAL_NAME'] }
												</c:if>
												</td>
											</tr>
											</c:if>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					</div>
				</div>
			</div>
</article>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%@ include file="../../inc/bottom.jsp"%>
