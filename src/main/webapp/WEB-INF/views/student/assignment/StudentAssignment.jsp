<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/student_top.jsp"%>

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
		$('#openSub').change(function(){
			var openSubCode = $('#openSub option:selected').val(); //이렇게하면 오픈 서브젝트의 코드가 나온다 이 코드랑 내가 다시 뿌려주는 코드랑 같으면 보여주고 아니면 안보여주고
			console.log(openSubCode);
			//여기서 에이젝스 처리? 
			// 누르면 값을 에이젝스로 컨트롤러로 보내서 그 값에 해당하는 과목명을 뽑아와서 밑에다 뿌려준다
			
			$('#hiddenSub').remove();
			
			$.ajax({
				url:"<c:url value='/student/assignment/selectMySubj'/>",
				data:{
					"openSubCode":openSubCode //위에서 만들어준거
				},
				dataType:"json",
				type:"post",
				success:function(res){
					console.log(res)
					console.log('res : '+res);
					
					var str = "";
					var openSubCode= "";
					$("#mySubj").empty();
					
					str+="<option>선택하세요.</option>"; //테이블 여는거 
					if(res.length > 0){
						openSubCode+="<input type='hidden' value='"+res[0].OPEN_SUB_CODE+"' name='openSubCode' id='hiddenSub'>";
					}
					$('#subjectDiv').append(openSubCode);
					
					
					$.each(res, function(idx, item){
						console.log(item)
						str+="<option value='"+item.ASSIGN_NO+"'>"+item.ASSIGN_NAME+"</option>"; //테이블 여는거 
					});
					
					$('#mySubj').append(str); //조회누르면 뿌려주는 바디부분

				}, //석세스 끝나는 부분
				error: function(err) {
					console.log(err)
				}
			});
			
		});
		
		
		
		
		
		
		
		$('#btSend').click(function(){
			
			if($('#openSub option:selected').val()=='선택하세요'){
				alert('과목을 선택하세요!');
				event.preventDefault();
				return false;
				
			}else if($('#mySubj option:selected').val()=='선택하세요' && $('#mySubj option:selected').val().length<0){
				alert("과제명을 선택하세요");
				$('#mySubj').focus();
				event.preventDefault();
				return false;
			}else if($('#assignName').val().length<1){
				alert("과제명을 입력하세요");
				$('#assignName').focus();
				event.preventDefault();
				return false;
			} 
			
			
		});
	});
</script>
<article>
	<div class="container col-lg-10" role="main">
			<h2>과제 등록</h2>
			<br>
				<div class="row">
				<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="far fa-file-alt"></i> 과제 등록
					</div>
					<div class="card-body">
					
				
					<!-- 폼 네임  -->
					
					
						<form name="frmAssign" method="post"  enctype="multipart/form-data"
							action="<c:url value='/student/assignment/assignmentInsert'/>">
							<div class="row mb-3">
								<div class="col-md-6">
									<div class="form-floating mb-3 mb-md-0" id="subjectDiv">
										<select id="openSub" name="openSub" class="dataTable-selector" style="width:100%">
											<option>선택하세요</option>
											<!-- 과목명 뿌려주는 곳 -->
											<c:if test="${!empty Mylist }">
												<c:forEach var="mySubj" items="${Mylist}">
													<option value="${mySubj['OPEN_SUB_CODE']}">${mySubj['SUBJ_NAME']}</option>
												</c:forEach>
											</c:if>
											
											
										</select>
										<label for="openSub">과목명</label>
									</div>
								</div>
								
								<!-- 과목선택하면 과제목록 불러오게하는 셀렉션 -->
								<div class="col-md-6">
									<div class="form-floating mb-3 mb-md-0">
										<select id="mySubj" name="mySubj" class="dataTable-selector" style="width:100%">
											<!-- 여기다 과목명 뿌려줘여함 -->
											<option> 선택하세요 </option>
										</select>
										<label for="openSub">과제명</label>
									</div>
								</div>
								
								<!-- ///////////////////////////////////////////////////// -->
								
							</div>
							<!-- <div class="col-md-6">
								<div class="form-floating mb-3 mb-md-0">
									<input class="form-control"  type="text" name="title" id="title"
										value=""/> <label for="assignName">과제 제목</label>
								</div>
							</div> <br> -->
							
							
							<label for="assignName">과제파일</label>
							<div class="col-md-6">
									<input class="form-control"  type="file" name="upfile" id="upfile"
										value=""/>  <span>(최대 20M)</span>
							</div>
							<div class="mt-4 mb-0">
								<div class="d-grid">
									<input type="submit" id="btSend" class="btn btn-primary btn-block" value="등록">
								</div>
							</div>
						</form>
					</div>
				</div>
				</div>
				
				
				<!--  여기는 내가 제출한 과제들 다보여주기  -->
					<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="far fa-file-alt"></i> 전체보기
						</div>
						<div class="card-body" style="height:450px">
							<table class="table-bordered text-center" style="width: 100%">
								<colgroup>
									<col style="width: 20%" />
									<col style="width: 20%" />
									<col style="width: 40%" />
									<col style="width: 20%" />
								</colgroup>
								<thead>
									<tr>
										<th>개설교과목번호</th>
										<th>교과목명</th>
										<th>과제명</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty AssignList }">
										<tr>
											<td colspan="4">제출한 과제가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty AssignList }">
										<c:forEach var="map" items="${AssignList }">
											<tr>
												<td>${map['OPEN_SUB_CODE'] }</td>
												<td>${map['SUBJ_NAME'] }</td>
												<td>${map['ASSIGN_NAME'] }</td>
												<td><fmt:formatDate value="${map['APPLY_DATE'] }" pattern="yyyy-MM-dd" /></td>
											</tr>
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
