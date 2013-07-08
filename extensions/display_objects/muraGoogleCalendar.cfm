<cfsilent><cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
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
<cfoutput><div id="mgcWrapper_#mgcid#" class="mgcWrapper"><div id="loading_#mgcid#" class="alert alert-block alert-success">Loading events...</div><div id="calendar_#mgcid#"></div></div>
<script>$(document).ready(function() {
	$('##calendar_#mgcid#').fullCalendar({
		buttonText:{day:'Day',week:'Week',month:'Month',today:'Today'}
		,timeFormat:'#arguments.mgctimeformat#'
		,eventSources:[
			{
				url:'#arguments.mgcurl#'
				,ignoreTimezone:false
				<cfif Len(arguments.mgcclassname)>,className:'#arguments.mgcclassname#'</cfif>
				<cfif Len(arguments.mgccolor)>,color:'#arguments.mgccolor#'</cfif>
				<cfif Len(arguments.mgctextcolor)>,textColor:'#arguments.mgctextcolor#'</cfif>
			}
		]
		,header:{left:'today prev,next title',center:'',right:<cfif YesNoFormat(arguments.mgcshowviewoptions)>'agendaDay,agendaWeek,month'<cfelse>''</cfif>}<cfif YesNoFormat(arguments.mgcshowviewoptions)>, defaultView: '#arguments.mgcdefaultview#'</cfif>
		,eventClick:function(event){window.open(event.url,'gcalevent','width=#Val(arguments.mgcwindowwidth)#,height=#arguments.mgcwindowheight#');return false;},loading:function(bool){if(bool){$('##loading_#mgcid#').show();}else{$('##loading_#mgcid#').hide();}}
	});
});</script></cfoutput>