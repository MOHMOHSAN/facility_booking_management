//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require tempusdominus-bootstrap-4.js
//= require datatables

$(document).on('turbolinks:load', function(){
	$("table[role='datatable']").each(function(){
		$(this).DataTable({
		  processing: true,
		  serverSide: true,
		  ajax: $(this).data('url')
		  	
		});
	});  

   	$('#datetimepicker').datetimepicker({
   		pickTime: false,
	    format: 'DD MMM YYYY',
	    minDate: Date(),
	    maxDate: new Date(Date.now() + (365 * 24 * 60 * 60 * 100)),
	    daysOfWeekDisabled: [0, 6]
	   
	});


})



