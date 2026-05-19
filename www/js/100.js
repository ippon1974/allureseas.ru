$(function() {
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "/css/datepicker/img/calendar.gif",
			buttonImageOnly: true
		});
$.datepicker.setDefaults(        
$.extend($.datepicker.regional["ru"]) 
    );   
});


$(function() {

          $( "#from,  #to" ).datepicker({
			showOn: "button",
			buttonImage: "/css/datepicker/img/calendar.gif",
			buttonImageOnly: true
		});
        
		
		var dates = $( "#from, #to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				var option = this.id == "from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
	});


























