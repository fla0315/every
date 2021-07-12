// Calendar Scripts

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
					    
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: ['interaction', 'dayGrid'],
		header: {
			left: 'prevYear, prev, next, nextYear, today',
			center: 'title',
			right: 'dayGridMonth, dayGridWeek, dayGridDay'
		}
	});
					    
	calendar.render();
}); 