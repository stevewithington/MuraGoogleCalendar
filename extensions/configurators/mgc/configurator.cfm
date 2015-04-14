<cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2015 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

	$ = StructKeyExists(session, 'siteid') ? 
		application.serviceFactory.getBean('$').init('session.siteid') : 
		application.serviceFactory.getBean('$').init('default');

	rbFactory = application.MuraGoogleCalendar.getResourceBundleFactory($);

	params = IsJSON($.event('params')) ? DeSerializeJSON($.event('params')) : {};
	defaultParams = application.MuraGoogleCalendar.getDefaultParams();
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
					<a class="accordion-toggle" data-toggle="collapse" data-parent="##mgcaccordion" href="##collapseBasic">#rbFactory.getKey('configurator.basicsettings')#</a>
				</div>
				<div id="collapseBasic" class="accordion-body collapse in">
					<div class="accordion-inner">
						<!--- mgcurl --->
						<div class="control-group">
							<label for="mgcurl" class="control-label">#rbFactory.getKey('configurator.feedurl')#</label>
							<p><a href="https://support.google.com/calendar/answer/37103?hl=en" target="_blank">#rbFactory.getKey('configurator.feedurldesc')# &gt;</a></p>
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
							<label for="mgctimeformat" class="control-label">#rbFactory.getKey('configurator.timeformat')#</label>
							<p>#rbFactory.getKey('configurator.timeformatdesc')#</p>
							<div class="controls">
								<select name="mgctimeformat" id="mgctimeformat" class="objectParam">
									<optgroup label="#rbFactory.getKey('configurator.northamericanformats')#">
										<option value="h(:mm)t" <cfif params.mgctimeformat eq 'h(:mm)t'>selected="selected"</cfif>>5p</option>
										<option value="h:mmt" <cfif params.mgctimeformat eq 'h:mmt'>selected="selected"</cfif>>5:00p</option>
										<option value="h:mm{ - h:mm}t" <cfif params.mgctimeformat eq 'h:mm{ - h:mm}t'>selected="selected"</cfif>>5:00p - 6:30p</option>
										<option value="h:mm{ - h:mm}" <cfif params.mgctimeformat eq 'h:mm{ - h:mm}'>selected="selected"</cfif>>5:00 - 6:30</option>
									</optgroup>
									<optgroup label="#rbFactory.getKey('configurator.globalformats')#">
										<option value="H(:mm)" <cfif params.mgctimeformat eq 'H(:mm)'>selected="selected"</cfif>>17</option>
										<option value="H:mm" <cfif params.mgctimeformat eq 'H:mm'>selected="selected"</cfif>>17:00</option>
										<option value="H(:mm){ - H(:mm)}" <cfif params.mgctimeformat eq 'H(:mm){ - H(:mm)}'>selected="selected"</cfif>>17 - 18:30</option>
										<option value="H:mm{ - H:mm}" <cfif params.mgctimeformat eq 'H:mm{ - H:mm}'>selected="selected"</cfif>>17:00 - 18:30</option>
									</optgroup>
								</select>
							</div>
						</div>

						<!--- mgcfirstday --->
						<div class="control-group">
							<label for="mgcfirstday" class="control-label">#rbFactory.getKey('configurator.firstdayofweek')#</label>							
							<div class="controls">
								<select name="mgcfirstday" id="mgcfirstday" class="objectParam">
									<cfset idx=0>
									<cfset arrWeekdays=ListToArray(rbFactory.getKey('calendar.weekdaylong'))>
									<cfloop array="#arrWeekdays#" index="day">
										<option value="#idx#" <cfif params.mgcfirstday eq idx>selected="selected"</cfif>>
											#day#
										</option>
										<cfset idx++>
									</cfloop>
								</select>
							</div>
						</div>

						<!--- mgcweeknds --->
						<div class="control-group">
							<label for="mgcweekends" class="control-label">#rbFactory.getKey('configurator.showweekends')#</label>
							<div class="radio inline">
								<input type="radio" name="mgcweekends" id="weekendsViewYes" class="objectParam" value="1" <cfif YesNoFormat(params.mgcweekends)>checked="checked"</cfif>>
								<label for="weekendsViewYes">#rbFactory.getKey('configurator.yes')#</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcweekends" id="weekendsViewNo" class="objectParam" value="0" <cfif !YesNoFormat(params.mgcweekends)>checked="checked"</cfif>>
								<label for="weekendsViewNo">#rbFactory.getKey('configurator.no')#</label>
							</div>
						</div>

						<!--- mgcshowviewoptions --->
						<div class="control-group">
							<label for="mgcshowviewoptions" class="control-label">#rbFactory.getKey('configurator.showviewoptions')#</label>
							<div class="radio inline">
								<input type="radio" name="mgcshowviewoptions" id="optionsViewYes" class="objectParam" value="1" <cfif YesNoFormat(params.mgcshowviewoptions)>checked="checked"</cfif>>
								<label for="optionsViewYes">#rbFactory.getKey('configurator.yes')#</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcshowviewoptions" id="optionsViewNo" class="objectParam" value="0" <cfif !YesNoFormat(params.mgcshowviewoptions)>checked="checked"</cfif>>
								<label for="optionsViewNo">#rbFactory.getKey('configurator.no')#</label>
							</div>
						</div>

						<!--- mgcdefaultview --->
						<div id="customViewOptions" class="control-group" <cfif !YesNoFormat(params.mgcshowviewoptions)>style="display:none;"</cfif>>
							<label for="mgcdefaultview" class="control-label">#rbFactory.getKey('configurator.defaultview')#</label>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewMonth" class="objectParam" value="month" <cfif params.mgcdefaultview eq 'month'>checked="checked"</cfif>>
								<label for="viewMonth">#rbFactory.getKey('calendar.month')#</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewWeek" class="objectParam" value="agendaWeek" <cfif params.mgcdefaultview eq 'agendaWeek'>checked="checked"</cfif>>
								<label for="viewWeek">#rbFactory.getKey('calendar.week')#</label>
							</div>
							<div class="radio inline">
								<input type="radio" name="mgcdefaultview" id="viewDay" class="objectParam" value="agendaDay" <cfif params.mgcdefaultview eq 'agendaDay'>checked="checked"</cfif>>
								<label for="viewDay">#rbFactory.getKey('calendar.day')#</label>
							</div>
						</div><!--- /customViewOptions --->
					</div><!--- /.accordion-inner --->
				</div><!--- /collapseBasic --->
			</div><!--- /.accordion-group --->

			<!--- ADVANCED --->
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="##mgcaccordion" href="##collapseAdvanced">#rbFactory.getKey('configurator.advancedsettings')#</a>
				</div>
				<div id="collapseAdvanced" class="accordion-body collapse">
					<div class="accordion-inner">
						<!--- mgcwindowwidth + mgdwindowheight --->
						<div class="control-group">
							<div class="span6">
								<label for="mgcwindowwidth" class="control-label">#rbFactory.getKey('configurator.eventwindowwidth')#</label>
								<div class="controls">
									<input type="text" 
										name="mgcwindowwidth" 
										id="mgcwindowwidth" 
										class="objectParam" 
										value="#params.mgcwindowwidth#">
								</div>
							</div>
							<div class="span6">
								<label for="mgcwindowheight" class="control-label">#rbFactory.getKey('configurator.eventwindowheight')#</label>
								<div class="controls">
									<input type="text" 
										name="mgcwindowheight" 
										id="mgcwindowheight" 
										class="objectParam" 
										value="#params.mgcwindowheight#">
								</div>
							</div>
						</div>

						<!--- mgccolor + mgctextcolor --->
						<div class="control-group">
							<div class="span6">
								<label for="mgccolor" class="control-label">#rbFactory.getKey('configurator.eventbackgroundcolor')#</label>
								<div class="controls">
									<input type="text" 
										name="mgccolor" 
										id="mgccolor" 
										class="objectParam" 
										value="#params.mgccolor#">
								</div>
							</div>
							<div class="span6">
								<label for="mgctextcolor" class="control-label">#rbFactory.getKey('configurator.eventtextcolor')#</label>
								<div class="controls">
									<input type="text" 
										name="mgctextcolor" 
										id="mgctextcolor" 
										class="objectParam" 
										value="#params.mgctextcolor#">
								</div>
							</div>
						</div>

						<!--- mgcclassname ---->
						<div class="control-group">
							<label for="mgcclassname" class="control-label">#rbFactory.getKey('configurator.cssclassname')#</label>
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
			</div><!--- /.accordion-group --->
		</div><!--- /.accordion --->		

		<input type="hidden" name="configuredDTS" class="objectParam" value="#Now()#">
		<input type="hidden" name="configuredBy" class="objectParam" value="#HTMLEditFormat($.currentUser('LName'))#, #HTMLEditFormat($.currentUser('FName'))#">
		<input type="hidden" name="mgcid" class="objectParam" value="#Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)#">

	</div><!--- /availableObjectParams --->
</cfoutput>