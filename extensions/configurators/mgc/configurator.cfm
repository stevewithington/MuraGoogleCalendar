<cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

	$ = StructKeyExists(session, 'siteid') ? 
		application.serviceFactory.getBean('MuraScope').init('session.siteid') : 
		application.serviceFactory.getBean('MuraScope').init('default');

	params = IsJSON($.event('params')) ? DeSerializeJSON($.event('params')) : {};

	defaultParams = {
		mgcurl = ''
		, mgcclassname = ''
	};
	
	StructAppend(params, defaultParams, false);
</cfscript>

<style type="text/css">
	#availableObjectParams dt { padding-top:1em; }
	#availableObjectParams dt.first { padding-top:0; }
</style>

<cfoutput>

	<div id="availableObjectParams"	
		data-object="plugin" 
		data-name="muraGoogleCalendar" 
		data-objectid="#$.event('objectID')#">

		<dl class="singleColumn">

			<!--- Message --->
			<dt class="first">
				<label for="size">Google Calendar XML Feed URL</label>
			</dt>
			<dd>
				<input type="text" 
					name="mgcurl" 
					id="mgcurl" 
					class="objectParam" 
					value="#params.mgcurl#">
			</dd>

			<dt>
				<label for="size">CSS Class Name</label>
			</dt>
			<dd>
				<input type="text" 
					name="mgcclassname" 
					id="mgcclassname" 
					class="objectParam" 
					value="#params.mgcclassname#">
			</dd>

			<!--- Future other fields:
				* mgcshowviewoptions
				* mgcdefaultview (agendaDay,agendaWeek,month) (NOT USED: basicDay,basicWeek)
				* allow for customizing the color(s)
			--->

			<!--- MISC. : Not necessary, just using as an example of how to add hidden fields --->
			<input type="hidden" name="configuredDTS" class="objectParam" value="#Now()#">
			<input type="hidden" name="configuredBy" class="objectParam" value="#HTMLEditFormat($.currentUser('LName'))#, #HTMLEditFormat($.currentUser('FName'))#">
			<input type="hidden" name="mgcid" class="objectParam" value="#Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)#">

		</dl>

	</div>

</cfoutput>