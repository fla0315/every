<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function(){
	  	
		// 학과별 교수목록 불러오기
		$('#deptNo').change(function() {
			
			var deptNo = $(this).val();
			
			$.ajax({
				url:"<c:url value='/admin/chart/profList?deptNo=" + deptNo + "'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					
					if(res.length == 0) {
						alert('해당 학과에 등록된 교수가 없습니다.');
						$("#profNo").empty();
						$("#profNo").append("<option value='0'>---선택하세요---</option>");
						
						
					} else if(res.length > 0) {
						$("#profNo").empty();
						var result = "";
						$.each(res, function(idx, item){
							result += "<option value='" + item.profNo + "'>" + item.profName + "</option>";
						});
						
						$("#profNo").append("<option value='0'>---선택하세요---</option>");
						$("#profNo").append(result);
					}
				},
				error:function(xhr, status, error){
					alert("error 발생!" + error);
				}
			});
		});
	  
		// 교수별 강의목록 불러오기
		$('#profNo').change(function() {
			
			var profNo = $(this).val();
			
			$.ajax({
				url:"<c:url value='/admin/chart/lectureList?profNo=" + profNo + "'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					
					if(res.length == 0) {
						alert('해당 교수에게 배정된 강의가 없습니다.');
						$("#lectureNo").empty();
						$("#lectureNo").append("<option value='0'>---선택하세요---</option>");
						
						
					} else if(res.length > 0) {
						$("#lectureNo").empty();
						var result = "";
						$.each(res, function(idx, map){
							result += "<option value='" + map['OPENSUBCODE'] + "'>" + map['SUBJECT'] + "</option>";
						});
						
						$("#lectureNo").append("<option value='0'>---선택하세요---</option>");
						$("#lectureNo").append(result);
					}
				},
				error:function(xhr, status, error){
					alert("error 발생!" + error);
				}
			});
		});
		
		
		
	  
		var date = new Date();
		var selYear = date.getFullYear();
		var selMonth = date.getMonth()+1;
		console.log(selMonth);
		var semester = '';
		
		if(selMonth == 7 || selMonth == 8) {
			semester = '2학기';
		} else if(selMonth == 1 || selMonth == 2) {
			semester = '1학기';
		}
		
		
		$('#semester').append("<span>(" + selYear + "년 " + semester + " 기준)</span>");
		
	});	 
  
  
  google.charts.load('current', {'packages':['bar']});
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart1);
  google.charts.setOnLoadCallback(drawChart2);

  function drawChart1() {
    var data1 = google.visualization.arrayToDataTable(
		    ${str1}
    );

    var options1 = {
            chart: {
              subtitle: '(강의 평점)'
            },
            vAxis: {format: 'decimal'},
            colors: ['#FF9F40', '#FF6384', '#AAAAFF']
          };

    var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart1.draw(data1, google.charts.Bar.convertOptions(options1));
  };
  
   

</script>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">
		교수 강의통계 &nbsp;
		<span id="semester"></span>
		</h1>
		<br>
		<br>
		<div style="height: 60px">
		<form name="searchfrm" method="get" action="<c:url value='/admin/chart/professorChart'/>">
			<div style="width: 200px; float: left; margin-right: 10px">
				<select class="form-control" name="deptNo" id="deptNo">
					<option value="">--학과를 선택하세요--</option>
					<!-- 반복문 시작 -->
					<c:forEach var="deptVo" items="${deptList }" varStatus="status">
						<option value="${deptVo.deptNo }">${deptVo.deptName }</option>
					</c:forEach>
				</select>
			</div>
			<div style="width: 200px; float: left; margin-right: 10px">
				<select class="form-control" name="profNo" id="profNo">
					<option value="">--교수를 선택하세요--</option>
					<!-- 반복문 시작 -->
				</select>
			</div>
			<div style="width: 200px; float: left; margin-right: 10px">
				<select class="form-control" name="lectureNo" id="lectureNo">
					<option value="">--강의를 선택하세요--</option>
					<!-- 반복문 시작 -->
				</select>
			</div>
			<div style="float: left;">
				<input type="submit" id="wr_submit" class="btn btn-primary btn-block" value="조회">
			</div>
		</form>
		</div>
		<div style="clear: both">
			<div class="col-xl-6" style="width: 650px; float: left">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 강의 평점
					</div>
					<c:if test="${empty str1}">
						<div style="text-align: center; margin:0 auto; display: flex; align-items: center; height: 400px">찾고자 하는 강의를 선택하세요</div>
					</c:if>
					<c:if test="${!empty str1}">
						<div id="columnchart_material" style="width: 600px; height: 450px; margin: 20px 0px 10px 20px;"></div>
					</c:if>
				</div>
			</div>
			<div class="col-xl-6" style="width: 550px; float: left; margin-left: 20px">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 강의 평가 댓글
					</div>
					<div class="card-body" style="height: 400px">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="text-align: center">강의 평가 내용</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty commentList}">
									<tr>
										<td colspan="1" style="text-align: center">과목 정보가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty commentList}">
								<c:forEach var="map" items="${commentList }">
						            <tr>
						               <td style="vertical-align: middle; text-align: center;">${map['CONTENT'] }</td>
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
</main>

<%@ include file="../../inc/bottom.jsp" %>