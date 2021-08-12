<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(function(){
	  	
		$("#stuName").autocomplete({  //오토 컴플릿트 시작
			source: List,	// source는 List 배열
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength: 1,// 최소 글자수
			delay: 100,	//autocomplete 딜레이 시간(ms)
			//disabled: true, //자동완성 기능 끄기
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
		$("#stuName").val((("${stuName}" == '') ? "" : "${stuName}"));
	});	 

	List = ${strAuto}
	
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
	              subtitle: '(평균)'
	            },
	            vAxis: {format: 'decimal'},
	            colors: ['#FF9F40', '#FF6384', '#AAAAFF'],
	            bar: {groupWidth: "90%"}
	          };
	
	    var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	    chart1.draw(data1, google.charts.Bar.convertOptions(options1));
	  }
  
  
  
</script>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">
		학생 성적통계 &nbsp;
		<span id="semester"></span>
		</h1>
		<br>
		<br>
		<div style="height: 60px">
		<form name="searchfrm" method="get" action="<c:url value='/admin/chart/studentChart'/>">
			<div style="width: 300px; float: left; margin-right: 10px">
				<input class="form-control" name="stuName" id="stuName" placeholder="학생명을 입력하세요" />
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
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 평균 점수
					</div>
					<c:if test="${empty str1}">
						<div style="text-align: center; margin:0 auto; display: flex; align-items: center; height: 400px">학생이름을 입력하세요</div>
					</c:if>
					<c:if test="${!empty str1}">
						<div id="columnchart_material" style="width: 600px; height: 450px; margin: 20px 0px 10px 20px;"></div>
					</c:if>
				</div>
			</div>
			<div class="col-xl-6" style="width: 550px; float: left; margin-left: 20px">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 과목별 성적
					</div>
					<div class="card-body" style="height: 480px">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="text-align: center">과목명</th>
									<th style="text-align: center">점수</th>
									<th style="text-align: center">등급</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty scoreList}">
									<tr>
										<td colspan="3" style="text-align: center">과목 정보가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty scoreList}">
								<c:forEach var="map" items="${scoreList }">
						            <tr>
						               <td style="vertical-align: middle; text-align: center;">${map['SUBJECT'] }</td>
						               <td style="vertical-align: middle; text-align: center;">${map['SCORE'] }</td>
						               <td id="grade" style="vertical-align: middle; text-align: center;">${map['GRADE'] }</td>
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