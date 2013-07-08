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
		, mgctimeformat = 'h(:mm)t'
		, mgcshowviewoptions = '1'
		, mgcdefaultview = 'month'
		, mgcclassname = ''
		, mgcwindowwidth = '800'
		, mgcwindowheight = '500'
		, mgccolor = ''
		, mgctextcolor = ''
	};
	
	StructAppend(params, defaultParams, false);
</cfscript>

<style type="text/css">
.accordion {
	background-color: #fff;
}
.accordion-heading {
	font-size: 1.1em;
	font-weight: bold;
	background-color: #ddd;
}
.accordion-heading a:hover {
	text-decoration: none;
}
</style>

<script>
	jQuery('input[name="mgcshowviewoptions"]').change(function() {
		var o = jQuery('#customViewOptions');
		if ( this.value == '1' ) {
			o.fadeIn('fast');
		} else {
			o.hide();
		}
	});
</script>

<cfoutput>

	<div id="availableObjectParams"	
		data-object="plugin" 
		data-name="muraGoogleCalendar" 
		data-objectid="#$.event('objectID')#">

		<div id="mgcaccordion" class="accordion row-fluid">
			<!--- BASIC --->
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="##mgcaccordion" href="##collapseBasic">Basic Settings</a>
				</div>
				<div id="collapseBasic" class="accordion-body collapse in">
					<div class="accordion-inner">
						<!--- mgcurl --->
						<div class="control-group">
							<label for="mgcurl" class="control-label">Google Calendar XML Feed URL</label>
							<p><a href="https://support.google.com/calendar/answer/37103?hl=en" target="_blank">Find your calendar's address &gt;</a></p>
							<div class="controls">
								<input type="text" 
									name="mgcurl" 
									id="mgcurl" 
									class="objectParam span12" 
									value="#params.mgcurl#">
							</div>
						</div>

						<!--- mgctimeformat --->
						<div class="control-group">
							<label for="mgctimeformat" class="control-label">Time Format</label>
							<p>How should the time be displayed for each event?</p>
							<div class="controls">
								<select name="mgctimeformat" id="mgctimeformat" class="objectParam">
									<optgroup label="North American Formats">
										<option value="h(:mm)t" <cfif params.mgctimeformat eq 'h(:mm)t'>selected="selected"</cfif>>5p</option>
										<option value="h:mmt" <cfif params.mgctimeformat eq 'h:mmt'>selected="selected"</cfif>>5:00p</option>
										<option value="h:mm{ - h:mm}t" <cfif params.mgctimeformat eq 'h:mm{ - h:mm}t'>selected="selected"</cfif>>5:00p - 6:30p</option>
										<option value="h:mm{ - h:mm}" <cfif params.mgctimeformat eq 'h:mm{ - h:mm}'>selected="selected"</cfif>>5:00 - 6:30</option>
									</optgroup>
									<optgroup label="Global/Military Formats">
										<option value="H(:mm)" <cfif params.mgctimeformat eq 'H(:mm)'>selected="selected"</cfif>>17</option>
										<option value="H:mm" <cfif params.mgctimeformat eq 'H:mm'>selected="selected"</cfif>>17:00</option>
										<option value="H(:mm){ - H(:mm)}" <cfif params.mgctimeformat eq 'H(:mm){ - H(:mm)}'>selected="selected"</cfif>>17 - 18:30</option>
										<option value="H:mm{ - H:mm}" <cfif params.mgctimeformat eq 'H:mm{ - H:mm}'>selected="selected"</cfif>>17:00 - 18:30</option>
									</optgroup>
								</select>
							</div>
						</div>

						<!--- mgcshowviewoptions --->
						<div class="control-group">
							<label for="mgcshowviewoptions" class="control-label">Show View Options?</label>
							<div class="radio inline">
								<input type="radio" name="mgcshowviewoptions" id="viewYes" class="objectParam" value="1" <cfif YesNoFormat(params.mgcshowviewoptions)>checked="checked"</cfif>>
								<label for="viewYes">Yes</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcshowviewoptions" id="viewNo" class="objectParam" value="0" <cfif !YesNoFormat(params.mgcshowviewoptions)>checked="checked"</cfif>>
								<label for="viewNo">No</label>
							</div>
						</div>

						<!--- mgcdefaultview --->
						<div id="customViewOptions" class="control-group" <cfif !YesNoFormat(params.mgcshowviewoptions)>style="display:none;"</cfif>>
							<label for="mgcdefaultview" class="control-label">Default View</label>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewMonth" class="objectParam" value="month" <cfif params.mgcdefaultview eq 'month'>checked="checked"</cfif>>
								<label for="viewMonth">Month</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewWeek" class="objectParam" value="agendaWeek" <cfif params.mgcdefaultview eq 'agendaWeek'>checked="checked"</cfif>>
								<label for="viewWeek">Week</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewDay" class="objectParam" value="agendaDay" <cfif params.mgcdefaultview eq 'agendaDay'>checked="checked"</cfif>>
								<label for="viewDay">Day</label>
							</div>
						</div><!--- /customViewOptions --->
					</div><!--- /.accordion-inner --->
				</div><!--- /collapseBasic --->
			</div><!--- /.accordion-group --->

			<!--- ADVANCED --->
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="##mgcaccordion" href="##collapseAdvanced">Advanced</a>
				</div>
				<div id="collapseAdvanced" class="accordion-body collapse">
					<div class="accordion-inner">
						<!--- mgccolor --->
						<div class="control-group">
							<div class="span6">
								<label for="mgcwindowwidth" class="control-label">Calendar Event Window Width</label>
								<div class="controls">
									<input type="text" 
										name="mgcwindowwidth" 
										id="mgcwindowwidth" 
										class="objectParam" 
										value="#params.mgcwindowwidth#">
								</div>
							</div>
							<div class="span6">
								<label for="mgcwindowheight" class="control-label">Calendar Event Window Height</label>
								<div class="controls">
									<input type="text" 
										name="mgcwindowheight" 
										id="mgcwindowheight" 
										class="objectParam" 
										value="#params.mgcwindowheight#">
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span6">
								<label for="mgccolor" class="control-label">Calendar Event Background Color</label>
								<div class="controls">
									<input type="text" 
										name="mgccolor" 
										id="mgccolor" 
										class="objectParam" 
										value="#params.mgccolor#">
								</div>
							</div>
							<div class="span6">
								<label for="mgctextcolor" class="control-label">Calendar Event TEXT Color</label>
								<div class="controls">
									<input type="text" 
										name="mgctextcolor" 
										id="mgctextcolor" 
										class="objectParam" 
										value="#params.mgctextcolor#">
								</div>
							</div>
						</div>

						<div class="control-group">
							<label for="mgcclassname" class="control-label">CSS Class Name</label>
							<div class="controls">
								<input type="text" 
									name="mgcclassname" 
									id="mgcclassname" 
									class="objectParam span12" 
									value="#params.mgcclassname#">
							</div>
						</div>
					</div><!--- /.accordion-inner --->
				</div><!--- /collapseAdvanced --->
			</div>
	
		</div><!--- /.accordion --->		

		<input type="hidden" name="configuredDTS" class="objectParam" value="#Now()#">
		<input type="hidden" name="configuredBy" class="objectParam" value="#HTMLEditFormat($.currentUser('LName'))#, #HTMLEditFormat($.currentUser('FName'))#">
		<input type="hidden" name="mgcid" class="objectParam" value="#Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)#">

	</div><!--- /availableObjectParams --->

</cfoutput>