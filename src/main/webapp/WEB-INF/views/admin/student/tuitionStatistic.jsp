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
	// bar chart
    var data1 = google.visualization.arrayToDataTable(
		    ${str1}
    );

    var options1 = {
            chart: {
              //title: '등록금 납부금액 상위 5개 학과',
              subtitle: '(등록금 납부금액 상위 5개 학과)'
            },
            vAxis: {format: 'decimal'},
            colors: ['#4BC0C0']
          };

    var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart1.draw(data1, google.charts.Bar.convertOptions(options1));
  }
  
  function drawChart2() {
		// bar chart
	    var data = google.visualization.arrayToDataTable(
			    ${str2}
	    );

	    var options = {
	              title: '학부별 비중',
	              pieHole: 0.55,
	              colors: ['#FF6384', '#FF9F40', '#FFCD56', '#4BC0C0', '#36A2EB'],
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
		
	});  
  

</script>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">등록금 통계</h1>
		<div id="semester" style="font-size: 1.5em"></div>
		<br>
		<div class="col-xl-6" style="width: 650px; float: left">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 학과별 등록금 총액
				</div>
				<div id="columnchart_material" style="width: 600px; height: 450px; margin: 20px 0px 10px 20px;"></div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 550px; float: left; margin-left: 20px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1" style="font-size: 1.3em"></i> 납부 등록금 학부별 비중
				</div>
				<div id="donutchart"></div>
			</div>
		</div>
	</div>
</main>

<script src="<c:url value='/resources/js/chart-pie-demo.js'/>"></script>
<%@ include file="../../inc/bottom.jsp" %>