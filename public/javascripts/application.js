// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

 $(document).ready(function() {
	
	var endTime = new Date();
	
	endTime.setSeconds(endTime.getSeconds() + parseFloat(secondsMore));
			
	new Date(endTime.getFullYear(), endTime.getMonth(), endTime.getDay(), endTime.getHours(), endTime.getMinutes(), endTime.getSeconds());
	$('#defaultCountdown').countdown({until: endTime, format: 'Ms'});


 });