<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/student_top.jsp"%>


<script type="text/javascript">

	$(function(){
	/* 	$('#opensubcode').change(function(){
			var opensubcode=$(this).val();
			console.log(opensubcode); //버튼 눌렀을 때 그 오픈서브젝트코드 가져오는 거
		}); */
		
		$('#btCheck').click(function(){
			event.preventDefault();
			noticeList();
		});
		
	});

	
	
	function noticeList(){
		
		var openSubCode=$('#openSubCode').val(); //학과
		console.log(openSubCode);
		
		$.ajax({
			url:"<c:url value='/student/studentNotice/studentNoticeAjax'/>",
			data:{
				"openSubCode":openSubCode,
			},
			dataType:"json",
			type:"post",
			success:function(res){
				console.log(res)
				var str = "";
				
				$("#noticeBody").empty();
				
				$.each(res, function(idx, item){
					console.log(item)
					str+="<tr class='' role='row' id=''>"; //테이블 여는거 
					str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.SUBJ_NAME+"</td>"; //제목
					str+="<td role='gridcell' style='height: 0px; width: 5%; '><a style='text-decoration:none; color=black;' href='<c:url value='/student/studentNotice/readCount?postNo="+item.POST_NO+"'/>'>"+item.TITLE+"</a></td>"; //제목
					str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.REG_DATE+"</td>"; //날짜
					str+="<td role='gridcell' style='height: 0px; width: 5%; '>"+item.READ_COUNT+"</td>"; //조회수
					str+="</tr>"; //테이블 닫는거
				});
 				
				$('#noticeBody ').append(str); //조회누르면 뿌려주는 바디부분

				//$('#meta_1').find('em').text(res.count); //총 조회건수

			}, //석세스 끝나는 부분
			error: function(err) {
				console.log(err)
			}
		});
	}
		
		
		
		
</script>


<div class="container col-lg-10" role="main">
<!-- <div class="container-fluid px-4"> --> <!-- 더 넓은거 -->
	<br><h2>공지사항</h2>
		<br>
		<!-- 공지사항에서 과목 고르기 -->
		
		<div class="mb-4">
			<label for="title">과목</label>
					<select id="openSubCode" name="openSubCode" class="dataTable-selector">
						<!-- 과목명 뿌려주는 곳 -->
						<c:if test="${!empty Mylist }">
								<option value="0">선택하세요</option>
							<c:forEach var="mySubj" items="${Mylist}">
								<option value="${mySubj['OPEN_SUB_CODE']}">${mySubj['SUBJ_NAME']}</option>
							</c:forEach>
						</c:if>
					</select>
			<button class="btn-search"  id="btCheck" >조회</button>
		</div>
	<!-- 이거 공지사항 부분 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 공지사항
		</div>
		<!-- 공지사항 바디부분 -->
		<div class="card-body">
			<table id="datatablesSimple">
			<thead>
				<tr>
					<th scope="col">과목명</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
				<tbody id="noticeBody">
					<!-- 여기에 에이잭스로 뿌려줘야함 씨발!! -->
				
				
				</tbody>

			</table>
		</div>
	</div>

</div>
<%@ include file="../../inc/bottom.jsp"%>
