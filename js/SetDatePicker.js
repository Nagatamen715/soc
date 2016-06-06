$(function () {
	var contact = '#ContactDate';
	var first = '#FirstAppointment';
	var sched = '#ScheduledAppointment';
	var dob = '#DOB';
	var start = '#StartDate';
	var end = '#EndDate';
	var picker = 'DateTimePicker';
	var min = moment().startOf('year');

	$(contact).datetimepicker({
		minDate: min,
		maxDate: 'now',
		format: 'MM/DD/YYYY hh:mm A'
	});
	
	$(contact).on('dp.change', function (e) {
		if (e.date !== false) {
			$(first).data(picker).minDate(e.date);
			$(sched).data(picker).minDate(e.date);
		} else {
			$(first).data(picker).minDate(min);
			$(sched).data(picker).minDate(min);
		}
	});
	$(dob).datetimepicker({
		minDate: '1/1/1900',
		maxDate: 'now',
		format: 'L',
		useCurrent: false,
		keepInvalid: true
	});
	$(first).datetimepicker({
		format: 'L',
		useCurrent: false,
		keepInvalid: true,
		minDate: (($(contact).val() !== '') ? $(contact).val() : min)
	});
	$(first).on('dp.change', function (e) {
		if (e.date !== false) {
			if (e.date <= moment()) {
				$(contact).data(picker).maxDate(e.date);
			} else {
				if ($(sched).val() == '' || moment().isBefore($(sched).val()) == true) {
					$(contact).data(picker).maxDate('now');
				}
			}
		} else {
			if ($(sched).val() == '' || moment().isBefore($(sched).val()) == true) {
				$(contact).data(picker).maxDate('now');
			}
		}
	});
	$(sched).datetimepicker({
		format: 'MM/DD/YYYY hh:mm A',
		useCurrent: false,
		keepInvalid: true,
		minDate: (($(contact).val() !== '') ? $(contact).val() : min)
	});
	$(sched).on('dp.change', function (e) {
		if (e.date !== false) {
			if (e.date <= moment()) {
				$(contact).data(picker).maxDate(e.date);
			} else {
				if ($(first).val() == '' || moment().isBefore($(first).val()) == true) {
					$(contact).data(picker).maxDate('now');
				}
			}
		} else {
			if ($(first).val() == '' || moment().isBefore($(first).val()) == true) {
				$(contact).data(picker).maxDate('now');
			}
		}
	});
	$(start).datetimepicker({
		format: 'L',
		useCurrent: false
	});
	$(end).datetimepicker({
		format: 'L',
		useCurrent: false
	});
	$(start).on('dp.change', function (e) {
		$(end).data(picker).minDate(e.date);
	});
	$(end).on('dp.change', function (e) {
		$(start).data(picker).maxDate(e.date);
	});

});
