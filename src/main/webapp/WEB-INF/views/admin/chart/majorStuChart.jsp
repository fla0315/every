<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
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
              subtitle: '(학년별 재학생 수)'
            },
            vAxis: {format: 'decimal'},
            colors: ['#AAAAFF']
          };

    var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart1.draw(data1, google.charts.Bar.convertOptions(options1));
  }
  
  function drawChart2() {
	    var data = google.visualization.arrayToDataTable(
			    ${str1}
	    );

	    var options = {
	              title: '학년별 비중',
	              pieHole: 0.55,
	              colors: ['#FF6384', '#FF9F40', '#FFCD56', '#4BC0C0'],
	              width: 540,
	              height: 480,
	              chartArea:{left:50,top:75, width:'100%',height:'100%'}
	          };

	    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));

	    chart.draw(data, options);
	  }

  $(function(){
	  
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
		
		$("#major").val((("${major}" == '') ? "" : "${major}")).prop("selected", true);              //select문
		
	});  
  

</script>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">
		학과별 학생 통계 &nbsp;
		<span id="semester"></span>
		</h1>
		<br>
		<br>
		<div style="height: 60px">
		<form name="searchfrm" method="get" action="<c:url value='/admin/chart/selectMajor'/>">
			<div style="width: 200px; float: left; margin-right: 10px">
				<select class="form-control" name="major" id="major">
					<option value="">--학과를 선택하세요--</option>
					<!-- 반복문 시작 -->
					<c:forEach var="deptVo" items="${deptList }" varStatus="status">
						<option value="${deptVo.deptName }">${deptVo.deptName }</option>
					</c:forEach>
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
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 학년별 재학생 수
					</div>
					<div id="columnchart_material" style="width: 600px; height: 450px; margin: 20px 0px 10px 20px;"></div>
				</div>
			</div>
			<div class="col-xl-6" style="width: 550px; float: left; margin-left: 20px">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 학년별 재학생 비중
					</div>
					<div id="donutchart"></div>
				</div>
			</div>
		</div>
	</div>
</main>

<script src="<c:url value='/resources/js/chart-pie-demo.js'/>"></script>
<%@ include file="../../inc/bottom.jsp" %>