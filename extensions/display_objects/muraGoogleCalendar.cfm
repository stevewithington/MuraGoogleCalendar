<cfsilent><cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
* 
* Regular format for time
* 	timeFormat: 'h(:mm)t{ - h(:mm)t}'
* 24-Hour format for time
* 	timeFormat: 'H(:mm){ - H(:mm)}', 
* 
*/
</cfscript>
<!--- 
	Future version : allow for multiple calendars
	<cfloop from="1" to="#ListLen(arguments.mgcurl, '^')#" index="local.i">
		{
			url: '#ListGetAt(arguments.mgcurl, local.i, '^')#',
			className: '#ListGetAt(arguments.mgcclassname, local.i, '^')#',
			ignoreTimezone: false
		}<cfif local.i neq ListLen(arguments.mgcurl, '^')>,</cfif>
	</cfloop>
--->
</cfsilent>
<cfoutput>
	<!--- Calendar --->
	<div class="mgcWrapper">
		<div id="loading">loading...</div>
		<div id="calendar"></div>
	</div>
	<script>
		$(document).ready(function() {
			$('##calendar').fullCalendar({
				buttonText: {
					day: 'Day',
					week: 'Week',
					month: 'Month',
					today: 'Today'
				},
				eventSources: [
					{
						url: '#arguments.mgcurl#',
						className: '#arguments.mgcclassname#',
						ignoreTimezone: false
					}
				],
				header: {
					left: 	'today prev,next title',
					center: '',
					right: 	'agendaDay,agendaWeek,month'
				},
				defaultView: 'month',
				eventClick:function(event){window.open(event.url,'gcalevent','width=700,height=600');return false;},
				loading:function(bool){if(bool){$('##loading').show();}else{$('##loading').hide();}}
			});
		});
	</script>

</cfoutput>