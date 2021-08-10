<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${fn:contains(firstNo, 'P')}">
		<jsp:include page="../inc/prof_top.jsp"></jsp:include>
	</c:when>
	<c:when test="${fn:contains(firstNo, 'E')}">
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../inc/student_top.jsp"></jsp:include>
	</c:otherwise>
</c:choose>

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
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="mainbox-tab"
					data-bs-toggle="pill" data-bs-target="#mainbox" type="button"
					role="tab" aria-controls="mainbox" aria-selected="true">쪽지</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="inbox-tab"
					data-bs-toggle="pill" data-bs-target="#inbox" type="button"
					role="tab" aria-controls="inbox" aria-selected="false">수신함</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="outbox-tab"
					data-bs-toggle="pill" data-bs-target="#outbox" type="button"
					role="tab" aria-controls="outbox" aria-selected="false">발신함</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="storagebox-tab"
					data-bs-toggle="pill" data-bs-target="#storagebox" type="button"
					role="tab" aria-controls="storagebox" aria-selected="false">보관함</button>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="mainbox"
				role="tabpanel" aria-labelledby="mainbox-tab">
			<!-- 메인 탭 -->
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

				<div class="tab-pane fade" id="inbox" role="tabpanel"
				aria-labelledby="inbox-tab">
				<c:import url="inbox.jsp"></c:import>	
			</div>
				
			<div class="tab-pane fade" id="outbox" role="tabpanel"
				aria-labelledby="outbox-tab">
				<c:import url="outbox.jsp"></c:import>	
			</div>
			
			<div class="tab-pane fade" id="storagebox" role="tabpanel"
				aria-labelledby="storagebox-tab">
				<c:import url="storagebox.jsp"></c:import>
			</div>
		</div>
	</div>
</article>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%@ include file="../inc/bottom.jsp"%>
