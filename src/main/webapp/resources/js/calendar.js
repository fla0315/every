// Calendar Scripts

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
					    
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: ['interaction', 'dayGrid'],
		header: {
			//left: 'prevYear, prev, next, nextYear, today',
			left: 'prev, next',
			center: 'title',
			//right: 'dayGridMonth, dayGridWeek, dayGridDay'
			right: 'today'
		},
		
		editable:true,
		events: [
		    {
		      title: '성적조회기간',
		      start: '2021-07-05',
		      end: '2021-07-09'
		    },
		    {
		      title: '최종성적확정일',
		      start: '2021-07-13',
		      end: '2021-07-14'
      		},
      		{
		      title: '[여름계절수업]성적입력(정정)기간',
		      start: '2021-07-27',
		      end: '2021-07-31'
      		}
		]
	});
					    
	calendar.render();
}); 