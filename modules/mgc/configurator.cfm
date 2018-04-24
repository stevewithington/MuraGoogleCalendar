<cfscript>
/**
*
* This file is part of MuraGoogleCalendar
*
* Copyright 2015-2018 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

	// FullCalendar: https://fullcalendar.io/

	// Mura Scope
	if ( !IsDefined('m') ) {
		m = StructKeyExists(session, 'siteid')
			? application.serviceFactory.getBean('MuraScope').init(session.siteid)
			: application.serviceFactory.getBean('MuraScope').init('default');
	}

    param name='objectparams.mgcurl' default='';
    param name='objectparams.mgctimeformat' default='h(:mm)t';
    param name='objectparams.mgcshowviewoptions' default='1';
    param name='objectparams.mgcdefaultview' default='month';
    param name='objectparams.mgcfirstday' default='0';
    param name='objectparams.mgcweekends' default='1';
    param name='objectparams.mgcclassname' default='';
    param name='objectparams.mgcwindowwidth' default='800';
    param name='objectparams.mgcwindowheight' default='500';
    param name='objectparams.mgccolor' default='';
    param name='objectparams.mgctextcolor' default='';
    param name='objectparams.mgcid' default='#Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)#';
</cfscript>
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
    <!--- mgcurl (Calendard ID) --->
        <div class="mura-control-group">
            <label for="mgcurl" class="mura-control-label">#m.rbKey('configurator.feedurl')#</label>
            <p><a href="https://support.google.com/calendar/answer/37103?hl=en" target="_blank">#m.rbKey('configurator.feedurldesc')# &gt;</a></p>
            <input type="text" name="mgcurl" id="mgcurl" class="objectParam" value="#objectparams.mgcurl#">
        </div>

    <!--- mgctimeformat --->
        <div class="mura-control-group">
            <label for="mgctimeformat" class="mura-control-label">#m.rbKey('configurator.timeformat')#</label>
            <p>#m.rbKey('configurator.timeformatdesc')#</p>
            <select name="mgctimeformat" id="mgctimeformat" class="objectParam">
                <optgroup label="#m.rbKey('configurator.northamericanformats')#">
                    <option value="h(:mm)t" <cfif objectparams.mgctimeformat eq 'h(:mm)t'>selected="selected"</cfif>>5p</option>
                    <option value="h:mmt" <cfif objectparams.mgctimeformat eq 'h:mmt'>selected="selected"</cfif>>5:00p</option>
                    <option value="h:mm{ - h:mm}t" <cfif objectparams.mgctimeformat eq 'h:mm{ - h:mm}t'>selected="selected"</cfif>>5:00p - 6:30p</option>
                    <option value="h:mm{ - h:mm}" <cfif objectparams.mgctimeformat eq 'h:mm{ - h:mm}'>selected="selected"</cfif>>5:00 - 6:30</option>
                </optgroup>
                <optgroup label="#m.rbKey('configurator.globalformats')#">
                    <option value="H(:mm)" <cfif objectparams.mgctimeformat eq 'H(:mm)'>selected="selected"</cfif>>17</option>
                    <option value="H:mm" <cfif objectparams.mgctimeformat eq 'H:mm'>selected="selected"</cfif>>17:00</option>
                    <option value="H(:mm){ - H(:mm)}" <cfif objectparams.mgctimeformat eq 'H(:mm){ - H(:mm)}'>selected="selected"</cfif>>17 - 18:30</option>
                    <option value="H:mm{ - H:mm}" <cfif objectparams.mgctimeformat eq 'H:mm{ - H:mm}'>selected="selected"</cfif>>17:00 - 18:30</option>
                </optgroup>
            </select>
        </div>

    <!--- mgcfirstday --->
        <div class="mura-control-group">
            <label for="mgcfirstday" class="mura-control-label">#m.rbKey('configurator.firstdayofweek')#</label>							
            <select name="mgcfirstday" id="mgcfirstday" class="objectParam">
                <cfset idx=0>
                <cfset arrWeekdays=ListToArray(m.rbKey('calendar.weekdaylong'))>
                <cfloop array="#arrWeekdays#" index="day">
                    <option value="#idx#" <cfif objectparams.mgcfirstday eq idx>selected="selected"</cfif>>
                        #day#
                    </option>
                    <cfset idx++>
                </cfloop>
            </select>
        </div>

    <!--- mgcweeknds --->
        <div class="mura-control-group">
            <label for="mgcweekends" class="mura-control-label">#m.rbKey('configurator.showweekends')#</label>
            <label class="radio inline">
                <input type="radio" name="mgcweekends" id="weekendsViewYes" class="objectParam" value="1" <cfif YesNoFormat(objectparams.mgcweekends)>checked="checked"</cfif> />
                #m.rbKey('configurator.yes')#
            </label>
            <label class="radio inline">
                <input type="radio" name="mgcweekends" id="weekendsViewNo" class="objectParam" value="0" <cfif !YesNoFormat(objectparams.mgcweekends)>checked="checked"</cfif> />
                #m.rbKey('configurator.no')#
            </label>
        </div>

    <!--- mgcshowviewoptions --->
        <div class="mura-control-group">
            <label for="mgcshowviewoptions" class="mura-control-label">#m.rbKey('configurator.showviewoptions')#</label>
            <label class="radio inline">
                <input type="radio" name="mgcshowviewoptions" id="optionsViewYes" class="objectParam" value="1" <cfif YesNoFormat(objectparams.mgcshowviewoptions)>checked="checked"</cfif> />
                #m.rbKey('configurator.yes')#
            </label>
            <label class="radio inline">
                <input type="radio" name="mgcshowviewoptions" id="optionsViewNo" class="objectParam" value="0" <cfif !YesNoFormat(objectparams.mgcshowviewoptions)>checked="checked"</cfif> />
                #m.rbKey('configurator.no')#
            </label>
        </div>

    <!--- mgcdefaultview --->
        <div id="customViewOptions" class="mura-control-group" <cfif !YesNoFormat(objectparams.mgcshowviewoptions)>style="display:none;"</cfif>>
            <label for="mgcdefaultview" class="mura-control-label">#m.rbKey('configurator.defaultview')#</label>
            <label class="radio inline">
                <input type="radio" name="mgcdefaultview" id="viewMonth" class="objectParam" value="month" <cfif objectparams.mgcdefaultview eq 'month'>checked="checked"</cfif> />
                #m.rbKey('calendar.month')#
            </label>
            <label class="radio inline">
                <input type="radio" name="mgcdefaultview" id="viewWeek" class="objectParam" value="agendaWeek" <cfif objectparams.mgcdefaultview eq 'agendaWeek'>checked="checked"</cfif> />
                #m.rbKey('calendar.week')#
            </label>
            <label class="radio inline">
                <input type="radio" name="mgcdefaultview" id="viewDay" class="objectParam" value="agendaDay" <cfif objectparams.mgcdefaultview eq 'agendaDay'>checked="checked"</cfif> />
                #m.rbKey('calendar.day')#
            </label>
        </div>

    <!--- mgcwindowwidth + mgdwindowheight --->
        <div class="mura-control-group">
            <div class="mura-control-inline half" style="padding-right:1em;">
                <label for="mgcwindowwidth" class="mura-control-label">#m.rbKey('configurator.eventwindowwidth')#</label>
                <input type="text" 
                    name="mgcwindowwidth" 
                    id="mgcwindowwidth" 
                    class="objectParam" 
                    value="#objectparams.mgcwindowwidth#">
            </div>
            <div class="mura-control-inline half">
                <label for="mgcwindowheight" class="mura-control-label">#m.rbKey('configurator.eventwindowheight')#</label>
                <input type="text" 
                    name="mgcwindowheight" 
                    id="mgcwindowheight" 
                    class="objectParam" 
                    value="#objectparams.mgcwindowheight#">
            </div>
        </div>

    <!--- mgccolor + mgctextcolor --->
        <div class="mura-control-group">
            <label for="mgccolor" class="mura-control-label">#m.rbKey('configurator.eventbackgroundcolor')#</label>
            <input type="text" 
                name="mgccolor" 
                id="mgccolor" 
                class="objectParam" 
                value="#objectparams.mgccolor#">
        </div>
        <div class="mura-control-group">
            <label for="mgctextcolor" class="mura-control-label">#m.rbKey('configurator.eventtextcolor')#</label>
            <input type="text" 
                name="mgctextcolor" 
                id="mgctextcolor" 
                class="objectParam" 
                value="#objectparams.mgctextcolor#">
        </div>

    <!--- mgcclassname ---->
        <div class="mura-control-group">
            <label for="mgcclassname" class="mura-control-label">#m.rbKey('configurator.cssclassname')#</label>
            <input type="text" 
                name="mgcclassname" 
                id="mgcclassname" 
                class="objectParam" 
                value="#objectparams.mgcclassname#">
        </div>

	<!--- MISC. --->
        <input type="hidden" name="configureddts" class="objectParam" value="#now()#" />
        <input type="hidden" name="configuredby" class="objectParam" value="#esapiEncode('html_attr', m.currentUser('LName'))#, #esapiEncode('html_attr', m.currentUser('FName'))#" />
        <input type="hidden" name="mgcid" class="objectParam" value="#objectparams.mgcid#" />
</cfoutput>