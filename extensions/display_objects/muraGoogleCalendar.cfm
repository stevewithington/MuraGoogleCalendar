<cfsilent><cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2014 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
* 
*/
</cfscript></cfsilent><cfoutput>
<div id="mgcWrapper_#mgcid#" class="mgcWrapper">
	<div id="loading_#mgcid#" class="alert alert-block alert-success">#local.rb.getKey('calendar.loadingevents')#</div>
	<div id="calendar_#mgcid#"></div>
</div>
<script>$(document).ready(function() {
	$('##calendar_#mgcid#').fullCalendar({
		googleCalendarApiKey:'#local.apikey#'
		,eventSources:[
			<cfloop from="1" to="#ListLen(arguments.mgcurl, ';')#" index="local.i">
			{
				url: '#ListGetAt(arguments.mgcurl, local.i, ';')#'
				,ignoreTimezone: false
				<cfif Len(arguments.mgcclassname)>
				,className:<cfif ListLen(arguments.mgcclassname, ';') eq ListLen(arguments.mgcurl, ';')>'#ListGetAt(arguments.mgcclassname, local.i, ';')#'<cfelse>'#arguments.mgcclassname#'</cfif>
				</cfif>
				<cfif Len(arguments.mgccolor)>
				,color:<cfif ListLen(arguments.mgccolor, ';') eq ListLen(arguments.mgcurl, ';')>'#ListGetAt(arguments.mgccolor, local.i, ';')#'<cfelse>'#arguments.mgccolor#'</cfif>
				</cfif>
				<cfif Len(arguments.mgctextcolor)>
				,textColor:<cfif ListLen(arguments.mgctextcolor, ';') eq ListLen(arguments.mgcurl, ';')>'#ListGetAt(arguments.mgctextcolor, local.i, ';')#'<cfelse>'#arguments.mgctextcolor#'</cfif>
				</cfif>
			}<cfif local.i neq ListLen(arguments.mgcurl, ';')>,</cfif>
			</cfloop>
		]
		,buttonText:{day:'#local.rb.getKey('calendar.day')#',week:'#local.rb.getKey('calendar.week')#',month:'#local.rb.getKey('calendar.month')#',today:'#local.rb.getKey('calendar.today')#'}
		,monthNames: #SerializeJSON(ListToArray(local.rb.getKey('calendar.monthLong')))#
		,monthNamesShort: #SerializeJSON(ListToArray(local.rb.getKey('calendar.monthShort')))#
		,dayNames: #SerializeJSON(ListToArray(local.rb.getKey('calendar.weekdaylong')))#
		,dayNamesShort: #SerializeJSON(ListToArray(local.rb.getKey('calendar.weekdayShort')))#
		,timeFormat:'#arguments.mgctimeformat#',firstDay:#arguments.mgcfirstday#,weekends:#arguments.mgcweekends#,header:{left:'today prev,next title',center:'',right:<cfif YesNoFormat(arguments.mgcshowviewoptions)>'agendaDay,agendaWeek,month'<cfelse>''</cfif>}<cfif YesNoFormat(arguments.mgcshowviewoptions)>,defaultView:'#arguments.mgcdefaultview#'</cfif>,eventClick:function(event){window.open(event.url,'gcalevent','width=#Val(arguments.mgcwindowwidth)#,height=#arguments.mgcwindowheight#');return false;},loading:function(bool){if(bool){$('##loading_#mgcid#').show();}else{$('##loading_#mgcid#').hide();}}
	});
});</script></cfoutput>