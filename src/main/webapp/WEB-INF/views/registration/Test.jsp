<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/regi_lec.css'/>">
<style type="text/css">
#divPage{
	margin: 0 auto;
    display: table;
}
</style>
<script type="text/javascript">
	$(function(){
		getDate();
		subjList(1);
		//학부 선택시 해당되는 학과만 나오도록 함
		$('#p_daehak').change(function(){
			var facultyNo=$('#p_daehak option:selected').val();
			$.ajax({
				url:"<c:url value='/registration/main'/>",
				type:"post",
				data:{"facultyNo":facultyNo},
				success:function(res){
					var str="<select name='p_major' id='p_major' style='width: 100%'>";
					str+="<option value='0'>---All---</option>";

					$.each(res, function(index, item){
						str+="<option value='"+item.depNo+"'>"+item.depName+"</option>";
					});
						str+="</select>";
						$('#major').html(str);
				}

			});
		});



		//검색 버튼 눌렀을때
		$('#selectBt').click(function(){
			subjList(1);
		});
	});

	
	//페이징처리 필요없음
/* 	function pageMake(obj) {
		var pagingInfo = obj.pagingInfo;

		var str = "";

		str += '<nav aria-label="Page navigation example">'
				+ '<ul class="pagination">';
		//이전블록
		if (pagingInfo.firstPage > 1) {
			str += '<li class="page-item">' + '<a class="page-link" href="#" '
					+ 'aria-label="Previous" onclick="subjList('
					+ (pagingInfo.firstPage - 1) + ')">'
					+ '<span aria-hidden="true">&laquo;</span>' + '</a></li>';
		}

		//페이지 처리
		for (var i = pagingInfo.firstPage; i <= pagingInfo.lastPage; i++) {
			if (i == pagingInfo.currentPage) {
				str += '<li class="page-item"><a class="page-link" '
						+ 'style="background: skyblue; color: white;">'
						+ i + '</a></li>';
			} else {
				str += '<li class="page-item"><a class="page-link" onclick="subjList('
						+ i + ')"' + ' href="#">' + i + '</a></li>';
			}
		}

		//다음 블록
		if (pagingInfo.lastPage < pagingInfo.totalPage) {
			str += '<li class="page-item">' + '<a class="page-link" href="#" '
					+ 'aria-label="Previous" onclick="subjList('
					+ (pagingInfo.lastPage + 1) + ')">'
					+ '<span aria-hidden="true">&laquo;</span>' + '</a></li>';
		}

		str += '</ul></nav>';

		$("#divPage").html(str);
	} */
	
	
	
	
	/* 검색하면 밑에 뿌려주는 부분 */
	//수강신청 모든 리스트(검색기능 사용시 검색할 내용만 sort)
	function subjList(currentPage){
		var facultyNo=$('#p_daehak').val();
		var department=$('#p_major').val();
		var subjName=$('#p_subjt').val();
		var time1=$('#p_day').val();
		var time2=$('#p_time').val();
		var profName=$('#p_teach').val();
		var openSubCode=$('#p_code').val();
		console.log(facultyNo+","+department);
		$.ajax({
			url:"<c:url value='/registration/openSubjList'/>",
			data:{
				"facultyNo":facultyNo,
				"depNo":department,
				"subjName":subjName,
				"time1":time1,
				"time2":time2,
				"profName":profName,
				"openSubCode":openSubCode,
				currentPage : currentPage
			},
			dataType:"json",
			type:"post",
			success:function(res){
				var str = "";
				var count=res.count;
				var checkNull=res.checkNull;
				console.log(checkNull);
				pageMake(res);
				$('#meta_1 em').text(count);
					if(checkNull=='Y'){
						str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
						str+="<td colspan='10'>검색된 학과가 없습니다.</td></tr>";

					}else if(checkNull=='N'){
							$.each(res.list, function(idx, item){
							var fileName=item.syllabus;
							var fileNameIdx=fileName.lastIndexOf("_");
							var extIdx=fileName.lastIndexOf(".");
							console.log(fileNameIdx);
							var ext=fileName.substr(extIdx);
							var originalFileName=fileName.substr(0, fileNameIdx)+ext;
							console.log(originalFileName);
							str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
							str+="<td role='gridcell' style='height: 0px; width: 7%;'><button type='button' class='applyBt'>신청</button></td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.openSubCode+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 18%; text-align: center'>"+item.subjName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 7%;'>"+(item.count/item.credit)+ "/" +item.personnel+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.profName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.credit+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 14%;'>"+item.shortNames+"/"+item.classroomName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.type+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+
							"<a href='<c:url value='/registration/download?fileName="+fileName+"&originalFileName="+originalFileName+"'/>'>"+
							originalFileName+"</a></td>";
							str+="</tr>";
						});
					}
 
				$('#gridLecture1 tbody').html(str); //조회누르면 뿌려주는 바디부분

				$('#meta_1').find('em').text(res.count); //총 조회건수

				
				
				
				
				
 
			/* 	$('.applyBt').click(function(){ //수강신청부분 => 나는 이거 장바구니로 바꿔야함
					var tdArr= new Array();
					var checkBtn= $(this);

					var tr = $(this).parent().parent();
					var td = tr.children();

					var openSubCode=td.eq(1).text();
					var subjName=td.eq(2).text();
					var col1=td.eq(3).text().split("/");
					var count=col1[0]*1;
					var personnel=col1[1]*1;
					var profName=td.eq(4).text();
					var credit=td.eq(5).text();
					var col2=td.eq(6).text().split("/");
					var shortName = col2[0];
					var classroomName = col2[1];
					var type = td.eq(7).text();
					var syllabus=td.eq(9).text();
					
					if(count>=personnel){
						alert('정원초과 다른 강의를 선택하세요.');
					 	return;
					}else{
						$.ajax({
							url:"<c:url value='/registration/checkDupTime'/>",
							data:{
								"shortName":shortName
							},
							type:"post",
							success:function(res){
								if(res=='N'){
									$.ajax({
										url:"<c:url value='/registration/insertReg'/>",
										data:{
											"type":type,
											"openSubCode":openSubCode
										},
										type:"post",
										success:function(res){
											alert(res);
											getRegistList();
										},
										error:function(xhr, status, error){
											alert(error);
										}
									});
									
								}else{
									alert('해당 시간 중복되는 과목이 있습니다.');
									return;
								}
							}
						});
						
						
						
					}

				}); */




			} //석세스 끝나는 부분



		});
	}


	/* //해당학생이 수강신청 한 리스트만 검색 후 출력
	function getRegistList(){
		$.ajax({
			url:"<c:url value='/registration/registList'/>",
			type:"post",
			dataType:"json",
			success:function(res){
				var str = "";
				var sum = 0;
				if(res.checkNull=="N"){
					$.each(res.subList, function(idx, item){
						sum+=item.credit;
						var fileName=item.syllabus;
						var fileNameIdx=fileName.lastIndexOf("_");
						var extIdx=fileName.lastIndexOf(".");
						console.log(fileNameIdx);
						var ext=fileName.substr(extIdx);
						var originalFileName=fileName.substr(0, fileNameIdx)+ext;
						str+="<tr class='jqgfirstrow' role='row' id='appliedList'>";
						str+="<td role='gridcell' style='height: 0px; width: 7%;'><button class='cancelBt'>취소</button></td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.openSubCode+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 18%; text-align: center'>"+item.subjName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 7%;'>"+item.personnel+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.profName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.credit+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 14%;'>"+item.shortNames+"/"+item.classroomName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.type+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+
						"<a href='<c:url value='/registration/download?fileName="+fileName+"&originalFileName="+originalFileName+"'/>'>"+
						originalFileName+"</a></td></tr>";
					});
				}else if(res.checkNull=="Y"){
					str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
					str+="<td colspan='10'>수강신청 내역이 없습니다.</td></tr>"
				}
				$('#gridLecture2 tbody').html(str);
				$('#numOfSubj').val(res.appliedCount);
				$('#sumCredit').val(sum);

				$('.cancelBt').click(function(){
					var tdArr= new Array();
					var tr = $(this).parent().parent();
					var td = tr.children();
					var openSubCode=td.eq(1).text();

					$.ajax({
						url:"<c:url value='/registration/deleteReg'/>",
						data:{
							"openSubCode":openSubCode
						},
						type:"post",
						success:function(res){
							alert(res);
							getRegistList();
						},
						error:function(xhr, status, error){
							alert(error);
						}
					});
				});

			}
		});
	} */





	function getDate(){
		//년도 띄우기
		var today = new Date();
		var year = today.getFullYear();
		$('#p_year').val(year).prop("selected", true);
		//임의로 분기별로 수강신청 해당학기 정함
		var month = today.getMonth()+1;
		if(month >= 1 && month <=3){
			$('#p_term').val('25').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 4 && month <=6){
			$('#p_term').val('10').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 7 && month <=9){
			$('#p_term').val('15').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 10 && month <=12){
			$('#p_term').val('20').prop("selected", true);
			$('#p_term').prop(disable);
		}
	}
</script>
<main role="main" class="flex-shrink-0">
<div class="container">

<div id="regi">
	<div class="content-panel">
		<div class="pnl-search">
			<table>
				<colgroup>
					<col width="60px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 대학 -->
					<col width="150px;">
					<!-- 대학 -->
					<col width="80px;">
					<!-- 학과 -->
					<col width="150px;">
					<!-- 학과 -->
					<col width="80px;">
					<!-- 강좌명 -->
					<col width="150px;">
					<!-- 강좌명 -->
					<col width="70px;">
					<!-- 조회 -->
				</colgroup>
				<!--  H : 학부 ,  D : 대학원 -->

				<tbody>
					<tr>
					<th id="hide1">년도</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">

                        <option value="2020">2020</option>

                        <option value="2019">2019</option>

                        <option value="2018">2018</option>

                        <option value="2017">2017</option>

                  </select></td>
						<th id="hide2">학기</th>
						<td id="hide3">
							<select name="p_term" id="p_term" style="width: 100%">
									<option value="10">1학기</option>
									<option value="20">2학기</option>
									<option value="15">&gt;여름계절</option>
									<option value="25">&gt;겨울계절</option>
							</select>
						</td>
						
						<th id="hide4">학부</th>
						<td>
							<select name="p_daehak" id="p_daehak" style="width: 100%">
								<option value="0">---All---</option>
									<c:if test="${!empty fList }">
										<c:forEach var="fVo" items="${fList }">
											<option value="${fVo.facultyNo }">${fVo.facultyName }</option>
										</c:forEach>
									</c:if>
							</select>
						</td>
						<th id="hide5">학과</th>
						<td id="major">
							<select name="p_major" id="p_major" style="width: 100%">
								<option value="0">---All---</option>
									<c:if test="${!empty dList }">
										<c:forEach var="dVo" items="${dList }">
											<option value="${dVo.depNo }">${dVo.depName }</option>
										</c:forEach>
									</c:if>
							</select>
						</td>
						<th id="hide6">강좌명</th>
						<td><input type="text" name="p_subjt" id="p_subjt" size="15"
							placeholder="검색어 (Search Word)"></td>
					</tr>
					<tr>
						<th id="hide7">요일</th>
						<td><select name="p_day" id="p_day" style="width: 100%">
								<option value="all">- All -</option>
								<option value="월">월요일</option>
								<option value="화">화요일</option>
								<option value="수">수요일</option>
								<option value="목">목요일</option>
								<option value="금">금요일</option>
						</select></td>
						<th id="hide8">수업시간</th>
						<td><select name="p_time" id="p_time" style="width: 100%">
								<option value="all">- All -</option>
								<option value="1">1교시</option>
								<option value="2">2교시</option>
								<option value="3">3교시</option>
								<option value="4">4교시</option>
								<option value="5">5교시</option>
								<option value="6">6교시</option>
								<option value="7">7교시</option>
								<option value="8">8교시</option>
						</select></td>
						<th id="hide9">교수명</th>
						<td><input type="text" name="p_teach" id="p_teach" placeholder="검색어 (Search Word)"></td>
						<th id="hide10">언어구분</th>
						<td><select name="p_lang" id="p_lang" style="width: 100%">
								<option value="">---- All ----</option>
								<option value="1">영어</option>
								<option value="2">영어(부분)</option>
								<option value="3">제2외국어</option>
						</select></td>
						<th id="hide11">학수번호<br>분반
						</th>
						<td><input type="text" name="p_code" id="p_code" placeholder="검색어 (Search Word)"></td>
					</tr>

				</tbody>
			</table>
			<div class="buttonset">
				<button class="btn-search"  id="selectBt" style="width: 40px;">조회</button>
			</div>
		</div>

		<!-- S: 조회 그리드 -->
		<div class="sw-header">
			<span style="font-weight: bold; font-size: 15px;">개설과목</span>
			<!-- <h2>종합시간표 조회</h2>-->
			<div class="buttonset">
				<span class="item" id="meta_1">총 조회건수<em>0</em>건
				</span>
				<!-- <button type="button" class="btn-icon">
				<i class="icon-refresh"></i>
				<span>새로고침</span>
			</button> -->
			</div>
		</div>
		<!-- E: 조회 그리드 -->
		<!-- S: 안내문구 -->
		<div class="wrap-grid">
			<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="gbox_gridLecture" dir="ltr" style="width: 100%;">
					<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
						style="width: 100%;">
						<div class="ui-jqgrid-hbox">
							<table class="ui-jqgrid-htable ui-common-table" role="presentation"
								aria-labelledby="gbox_gridLecture">
								<thead>
									<tr class="ui-jqgrid-labels" role="row">
										<th id="gridLecture_rn" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 7%;">
											<div id="jqgh_gridLecture_rn">
												<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
												</span>
											</div>
										</th>
										<th id="gridLecture_lecture_cd_disp" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lecture_cd_disp"
												class="ui-jqgrid-sortable">
												학수번호-분반<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_subjt_name" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 18%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_subjt_name"
												class="ui-jqgrid-sortable">
												강좌명<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_lect_grade" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 7%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_asign_pcnt"
												class="ui-jqgrid-sortable">
												정원<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_teach_na" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_teach_na" class="ui-jqgrid-sortable">
												교수명<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_unit_num" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 5%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_unit_num" class="ui-jqgrid-sortable">
												학점<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_timetable" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 14%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_timetable"
												class="ui-jqgrid-sortable">
												강의시간/강의실<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_field_gb" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 6%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_field_gb" class="ui-jqgrid-sortable">
												이수구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_eng_yn_nm" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_eng_yn_nm"
												class="ui-jqgrid-sortable">
												언어구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_bigo" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>

										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
												강의계획서<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="ui-jqgrid-bdiv" >
						<div style="position: relative;">
							<table id="gridLecture1" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>

								</tbody>
								<tfoot>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<div class="ui-jqgrid-resize-mark" id="rs_mgridLecture">&nbsp;
				 <div id="divPage"></div>
				 </div>
			</div>














			<div style="margin: 20px; margin-left: 0;">
				<span style="font-weight: bold; font-size: 15px;">신청과목</span>
			</div>
			<!-- 수강신청 -->
					<div class="wrap-grid">
			<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="gbox_gridLecture" dir="ltr" style="width: 100%;">
					<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
						style="width: 100%;">
						<div class="ui-jqgrid-hbox">
							<table class="ui-jqgrid-htable ui-common-table" role="presentation"
								aria-labelledby="gbox_gridLecture">
								<thead>
									<tr class="ui-jqgrid-labels" role="row">
										<th id="gridLecture_rn" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 7%;">
											<div id="jqgh_gridLecture_rn">
												<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
												</span>
											</div>
										</th>
										<th id="gridLecture_lecture_cd_disp" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lecture_cd_disp"
												class="ui-jqgrid-sortable">
												학수번호-분반<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_subjt_name" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 18%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_subjt_name"
												class="ui-jqgrid-sortable">
												강좌명<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_lect_grade" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 7%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>

										<div id="jqgh_gridLecture_asign_pcnt"
												class="ui-jqgrid-sortable">
												정원<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_teach_na" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_teach_na" class="ui-jqgrid-sortable">
												교수명<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_unit_num" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 5%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_unit_num" class="ui-jqgrid-sortable">
												학점<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_timetable" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 14%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_timetable"
												class="ui-jqgrid-sortable">
												강의시간/강의실<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_field_gb" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 6%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_field_gb" class="ui-jqgrid-sortable">
												이수구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_eng_yn_nm" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_eng_yn_nm"
												class="ui-jqgrid-sortable">
												언어구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_bigo" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>

										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
												강의계획서<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="ui-jqgrid-bdiv" >
						<div style="position: relative;">
							<table id="gridLecture2" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="ui-jqgrid-resize-mark" id="rs_mgridLecture">&nbsp;</div>
			</div>

			<div style="margin-bottom: 20px; margin-top: 10px;">
				<form action="" style="float: right;">
					<label>신청과목수 : </label>
					<input type="text" id="numOfSubj" style="width: 80px;">
					<label>신청학점 : </label>
					<input type="text" id="sumCredit" style="width: 80px;">
					<label>최대한도학점 : </label>
					<input type="text" style="width: 80px;">
				</form>
			</div>
		</div>
	</div>

<%@ include file="../inc/bottom.jsp"%>











<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="config.mybatis.mapper.oracle.registration">
	<select id="selectFaculty" resultType="facultyVo">
		select * from faculty
		order by faculty_name
	</select>

	<select id="selectDepartment" resultType="departmentVo"
		parameterType="int">
		select * from department
		<if test="value!=0">
			where faculty_no=#{facultyNo}
		</if>
		order by dep_name
	</select>

	<select id="openSubjList" resultType="openSubjListVo"
		parameterType="registrationSearchVo">
		select * from
		(select C.* from 
		(select rownum as RNUM,B.* from
		(select A.*, length(short_names) - length(replace(short_names, ',', ''))
		CHAR_COUNT
		from
		(select o.open_sub_code, s.subj_name, s.personnel, p.prof_name, s.credit,
		rt.short_names, cr.classroom_name, st.type, sy.syllabus,
		count(r.stu_no) as count
		from open_subj o join subject s
		on
		o.subj_code=s.subj_code
		join professor p
		on s.prof_no=p.prof_no
		join
		subj_time stime
		on stime.open_sub_code=o.open_sub_code
		join
		regi_timetable rt
		on rt.open_sub_code=o.open_sub_code
		join classroom cr
		on cr.classroom_code=stime.classroom_code
		join subj_type st
		on
		st.type_code=s.type_code
		join syllabus sy
		on
		sy.open_sub_code=o.open_sub_code
		left join registration r
		on r.sub_code=o.open_sub_code
		join department d
		on d.dep_no=substr(o.open_sub_code, 1, 3)
		where o.close_date is null
			<if test="facultyNo!=0">and d.faculty_no=#{facultyNo}</if>
			<if test="depNo!=0">and d.dep_no=#{depNo}</if>
			<if test="subjName!=null">and s.subj_name like '%' || #{subjName} || '%'</if>
			<if test="time1!='all' and time2=='all'">and rt.short_names like '%' || #{time1} || '%'</if>
			<if test="time2!='all' and time1=='all'">and rt.short_names like '%' || #{time2} || '%'</if>
			<if test="time1!='all' and time2!='all'">and rt.short_names like '%' || #{time} || '%'</if>
			<if test="profName!=null">and p.prof_name like '%' || #{profName} || '%'</if>
			<if test="openSubCode!=null">and o.open_sub_code like '%' || #{openSubCode} || '%'
			</if>
		group by o.open_sub_code, s.subj_name, s.personnel, p.prof_name,
		s.credit, rt.short_names, cr.classroom_name, st.type, sy.syllabus)A)B
		where credit = char_count + 1)C)
		<![CDATA[ 
		where RNUM>#{firstRecordIndex}
		  and RNUM<=#{firstRecordIndex }+ #{recordCountPerPage}]]>
	</select>
	<%-- <select id="openSubjCount" resultType="int"
		parameterType="registrationSearchVo">
		select count(*) from
		(select C.* from 
		(select rownum as RNUM,B.* from
		(select A.*, length(short_names) - length(replace(short_names, ',', ''))
		CHAR_COUNT
		from
		(select o.open_sub_code, s.subj_name, s.personnel, p.prof_name, s.credit,
		rt.short_names, cr.classroom_name, st.type, sy.syllabus,
		count(r.stu_no) as count
		from open_subj o join subject s
		on
		o.subj_code=s.subj_code
		join professor p
		on s.prof_no=p.prof_no
		join
		subj_time stime
		on stime.open_sub_code=o.open_sub_code
		join
		regi_timetable rt
		on rt.open_sub_code=o.open_sub_code
		join classroom cr
		on cr.classroom_code=stime.classroom_code
		join subj_type st
		on
		st.type_code=s.type_code
		join syllabus sy
		on
		sy.open_sub_code=o.open_sub_code
		left join registration r
		on r.sub_code=o.open_sub_code
		join department d
		on d.dep_no=substr(o.open_sub_code, 1, 3)
		where o.close_date is null
			<if test="facultyNo!=0">and d.faculty_no=#{facultyNo}</if>
			<if test="depNo!=0">and d.dep_no=#{depNo}</if>
			<if test="subjName!=null">and s.subj_name like '%' || #{subjName} || '%'</if>
			<if test="time1!='all' and time2=='all'">and rt.short_names like '%' || #{time1} || '%'</if>
			<if test="time2!='all' and time1=='all'">and rt.short_names like '%' || #{time2} || '%'</if>
			<if test="time1!='all' and time2!='all'">and rt.short_names like '%' || #{time} || '%'</if>
			<if test="profName!=null">and p.prof_name like '%' || #{profName} || '%'</if>
			<if test="openSubCode!=null">and o.open_sub_code like '%' || #{openSubCode} || '%'
			</if>
		group by o.open_sub_code, s.subj_name, s.personnel, p.prof_name,
		s.credit, rt.short_names, cr.classroom_name, st.type, sy.syllabus)A)B
		where credit = char_count + 1)C)
	</select>



	<select id="selectRegisted" parameterType="string"
		resultType="string">
		select * from registration where stu_no=#{value}
	</select>



	<select id="registedList" parameterType="list"
		resultType="openSubjListVo">
		<if test="list!=null">
			select o.open_sub_code, s.subj_name, s.personnel, p.prof_name,
			s.credit, rt.short_names, cr.classroom_name, st.type, sy.syllabus,
			count(r.stu_no) as count
			from open_subj o join subject s
			on o.subj_code=s.subj_code
			join professor p
			on s.prof_no=p.prof_no
			join subj_time stime
			on stime.open_sub_code=o.open_sub_code
			join regi_timetable rt
			on rt.open_sub_code=o.open_sub_code
			join classroom cr
			on cr.classroom_code=stime.classroom_code
			join subj_type st
			on st.type_code=s.type_code
			join syllabus sy
			on sy.open_sub_code=o.open_sub_code
			left join registration r
			on r.sub_code=o.open_sub_code
			where o.close_date is null
			and r.sub_code in
			<foreach collection="list" item="item" index="index" open="("
				separator="," close=")">
				#{item}
			</foreach>
			group by o.open_sub_code, s.subj_name, s.personnel, p.prof_name,
			s.credit, rt.short_names, cr.classroom_name, st.type, sy.syllabus
		</if>

	</select>

	<insert id="insertReg" parameterType="hashMap">
		insert into
		registration(sub_code, stu_no, classification)
		values(#{openSubCode},
		#{stuNo}, (select type_code from subj_type where type=#{type}))
	</insert>
	<insert id="insertEval" parameterType="hashMap">
		insert into
		evaluation(sub_code, stu_no, classification)
		values(#{openSubCode},
		#{stuNo}, (select type_code from subj_type where type=#{type}))
	</insert>

	<select id="countForDup" parameterType="hashMap"
		resultType="int">
		select count(*) from registration where
		sub_code=#{openSubCode} and stu_no=#{stuNo}
	</select>

	<delete id="deleteReg" parameterType="hashMap">
		delete from registration
		where stu_no=#{stuNo} and sub_code=#{openSubCode}
	</delete>

	<delete id="deleteEval" parameterType="hashMap">
		delete from evaluation
		where stu_no=#{stuNo} and sub_code=#{openSubCode}
	</delete>
	
	<select id="codeListByStuNo" parameterType="string" resultType="string">
		select sub_code from registration where stu_no=#{stuNo}
	</select>
	
	<select id="shortNameByCode" parameterType="String" resultType="String">
		select short_names from regi_timetable where open_sub_code=#{openSubCode}
	</select>
 --%>
</mapper>






@Controller
public class RegistrationController {
	private static final Logger logger=LoggerFactory.getLogger(RegistrationController.class);
	@Autowired
	private RegistrationService registServ;
	@Autowired 
	private FileUploadUtil fileUploadUtil;
	
	
	@RequestMapping(value = "/registration/openSubjList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openSubjList(@ModelAttribute RegistrationSearchVO regSearchVo, Model model) {
		
		if(!regSearchVo.getTime1().equals("all") && !regSearchVo.getTime2().equals("all")) {
			regSearchVo.setTime(regSearchVo.getTime1()+regSearchVo.getTime2());
		}
		
		logger.info("개설된 강의 읽어가기 파라미터 registrationsearchvo={}", regSearchVo);

		String checkNull = "";\
		List<OpenSubjListVO> list = registServ.openSubjList(regSearchVo);
		
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("checkNull", checkNull);
		map.put("pagingInfo", pagingInfo);
		return map;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/registration/checkDupTime", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkDupTime(Principal principal,@RequestParam String shortName) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo=user.getOfficialNo();
		logger.info("수강신청 시 겹치는 시간이 있는지 체크 처리 shortName={}, stuNo={}", shortName, stuNo);
		String isDup="";
		String[]timeArr=shortName.split(",");
		String shortTimeNames = "";
		List<String> codeList = registServ.codeListByStuNo(stuNo);
		if(codeList.size() < 1) { return "N"; }else { for(int i=0; i<
		codeList.size(); i++) { String openSubCode = codeList.get(i);
		shortTimeNames += registServ.shortNameByCode(openSubCode)+","; } }
		for(int i = 0; i< timeArr.length; i++) { int result =
		shortTimeNames.indexOf(timeArr[i]); if(result != -1) { return "Y";
		}else { isDup="N"; } } return isDup; } } <!-- S: 조회 그리드 -->
		
		
		
		
		
		
		
		
		
		<div class="sw-header">
			<span style="font-weight: bold; font-size: 15px;">개설과목</span>
			<!-- <h2>종합시간표 조회</h2>-->
			<div class="buttonset">
				<span class="item" id="meta_1">총 조회건수<em>0</em>건
				</span>
				<!-- <button type="button" class="btn-icon">
				<i class="icon-refresh"></i>
				<span>새로고침</span>
			</button> -->
			</div>
		</div>
		<!-- E: 조회 그리드 --> <!-- S: 안내문구 -->
		<div class="wrap-grid">
			<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="gbox_gridLecture" dir="ltr" style="width: 100%;">
				<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
					style="width: 100%;">
					<div class="ui-jqgrid-hbox">
						<table class="ui-jqgrid-htable ui-common-table"
							role="presentation" aria-labelledby="gbox_gridLecture">
							<thead>
								<tr class="ui-jqgrid-labels" role="row">
									<th id="gridLecture_rn" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 7%;">
										<div id="jqgh_gridLecture_rn">
											<span class="s-ico" style="display: none"> <span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
												<span sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
											</span>
										</div>
									</th>
									<th id="gridLecture_lecture_cd_disp" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 9%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_lecture_cd_disp"
											class="ui-jqgrid-sortable">
											학수번호-분반<span class="s-ico" style="display: none"> <span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
												<span sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_subjt_name" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 18%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_subjt_name"
											class="ui-jqgrid-sortable">
											강좌명<span class="s-ico" style="display: none"> <span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
												<span sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_lect_grade" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 7%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_asign_pcnt"
											class="ui-jqgrid-sortable">
											정원<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_teach_na" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 9%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_teach_na" class="ui-jqgrid-sortable">
											교수명<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_unit_num" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 5%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_unit_num" class="ui-jqgrid-sortable">
											학점<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_timetable" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 14%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_timetable"
											class="ui-jqgrid-sortable">
											강의시간/강의실<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_field_gb" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 6%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_field_gb" class="ui-jqgrid-sortable">
											이수구분<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_eng_yn_nm" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 9%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_eng_yn_nm"
											class="ui-jqgrid-sortable">
											언어구분<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
									<th id="gridLecture_bigo" role="columnheader"
										class="ui-state-default ui-th-column ui-th-ltr"
										style="width: 9%;"><span
										class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
										style="cursor: col-resize;">&nbsp;</span>

										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
											강의계획서<span class="s-ico" style="display: none"><span
												sort="asc"
												class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
												sort="desc"
												class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
										</div></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>




				<div class="ui-jqgrid-bdiv">
					<div style="position: relative;">
						<table id="gridLecture1" tabindex="0" cellspacing="0"
							cellpadding="0" border="0" role="presentation"
							aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
							class="ui-jqgrid-btable"
							style="text-align: center; font-size: 15px;">
							<tbody>

							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>




			</div>
			<div class="ui-jqgrid-resize-mark" id="rs_mgridLecture">
				&nbsp;
				<div id="divPage"></div>
			</div>
		</div>