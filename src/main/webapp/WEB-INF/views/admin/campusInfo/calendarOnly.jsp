<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>"/>
<link href="<c:url value='/resources/calendar/core/main.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/calendar/daygrid/main.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/calendar/core/main.js'/>"></script>
<script src="<c:url value='/resources/calendar/interaction/main.js'/>"></script>
<script src="<c:url value='/resources/calendar/daygrid/main.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/resources/js/id-validate.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
					    
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: ['dayGrid'],
		header: {
			left: 'prev, next',
			center: 'title',
			right: 'today'
		},
		
		editable:true,
		events: [
		    ${str}
		]
	});
					    
	calendar.render();
}); 


</script>

	<div class="col-xl-6" style="float: left; width: 600px; margin: 20px">
		<div class="card mb-4">
			<div class="card-header">
				<i class="far fa-calendar-alt me-1"></i> 학사일정
			</div>
			<div id="calendar" style="float: left; width: 100%"></div>
		</div>
	</div>