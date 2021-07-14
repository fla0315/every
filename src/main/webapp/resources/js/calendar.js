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
		}
	});
					    
	calendar.render();
}); 