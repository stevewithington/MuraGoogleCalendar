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
    // local.modulepath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot')));
    local.apikey = m.getBean('pluginManager').getConfig('MuraGoogleCalendar').getSetting('mgcAPIKey');

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
<cfoutput>
    <cfif Not Len(local.apikey)>
        <div class="alert alert-warning">
            <strong>Sorry &hellip;</strong> 
            the MuraGoogleCalendar API Key is required.<br>
            Please <a href="https://github.com/stevewithington/MuraGoogleCalendar">review the setup instructions</a> for more information.
        </div>
    <cfelseif Not Len(objectparams.mgcurl)>
        <div class="alert alert-warning">
            <strong>Sorry &hellip;</strong> 
            the #m.rbKey('configurator.feedurl')# is required.<br>
            Please <a href="https://github.com/stevewithington/MuraGoogleCalendar">review the setup instructions</a> for more information.
        </div>
    <cfelse>
        <div id="mgcWrapper_#objectparams.mgcid#" class="mgcWrapper">
            <div id="loading_#objectparams.mgcid#" class="alert alert-block alert-success">#m.rbKey('calendar.loadingevents')#</div>
            <div id="calendar_#objectparams.mgcid#"></div>
        </div>
        <script>jQuery(document).ready(function($) {
            $('##calendar_#objectparams.mgcid#').fullCalendar({
                googleCalendarApiKey:'#local.apikey#'
                ,eventSources:[
                    <cfloop from="1" to="#ListLen(objectparams.mgcurl, ';')#" index="local.i">
                    {
                        googleCalendarId: '#ListGetAt(objectparams.mgcurl, local.i, ';')#'
                        ,ignoreTimezone: false
                        <cfif Len(objectparams.mgcclassname)>
                        ,className:<cfif ListLen(objectparams.mgcclassname, ';') eq ListLen(objectparams.mgcurl, ';')>'#ListGetAt(objectparams.mgcclassname, local.i, ';')#'<cfelse>'#objectparams.mgcclassname#'</cfif>
                        </cfif>
                        <cfif Len(objectparams.mgccolor)>
                        ,color:<cfif ListLen(objectparams.mgccolor, ';') eq ListLen(objectparams.mgcurl, ';')>'#ListGetAt(objectparams.mgccolor, local.i, ';')#'<cfelse>'#objectparams.mgccolor#'</cfif>
                        </cfif>
                        <cfif Len(objectparams.mgctextcolor)>
                        ,textColor:<cfif ListLen(objectparams.mgctextcolor, ';') eq ListLen(objectparams.mgcurl, ';')>'#ListGetAt(objectparams.mgctextcolor, local.i, ';')#'<cfelse>'#objectparams.mgctextcolor#'</cfif>
                        </cfif>
                    }<cfif local.i neq ListLen(objectparams.mgcurl, ';')>,</cfif>
                    </cfloop>
                ]
                ,buttonText:{day:'#m.rbKey('calendar.day')#',week:'#m.rbKey('calendar.week')#',month:'#m.rbKey('calendar.month')#',today:'#m.rbKey('calendar.today')#'}
                ,monthNames: #SerializeJSON(ListToArray(m.rbKey('calendar.monthLong')))#
                ,monthNamesShort: #SerializeJSON(ListToArray(m.rbKey('calendar.monthShort')))#
                ,dayNames: #SerializeJSON(ListToArray(m.rbKey('calendar.weekdaylong')))#
                ,dayNamesShort: #SerializeJSON(ListToArray(m.rbKey('calendar.weekdayShort')))#
                ,timeFormat:'#objectparams.mgctimeformat#',firstDay:#objectparams.mgcfirstday#,weekends:<cfif objectparams.mgcweekends>true<cfelse>false</cfif>,header:{left:'today prev,next title',center:'',right:<cfif YesNoFormat(objectparams.mgcshowviewoptions)>'agendaDay,agendaWeek,month'<cfelse>''</cfif>}<cfif YesNoFormat(objectparams.mgcshowviewoptions)>,defaultView:'#objectparams.mgcdefaultview#'</cfif>,eventClick:function(event){window.open(event.url,'gcalevent','width=#Val(objectparams.mgcwindowwidth)#,height=#objectparams.mgcwindowheight#');return false;},loading:function(bool){if(bool){$('##loading_#objectparams.mgcid#').show();}else{$('##loading_#objectparams.mgcid#').hide();}}
            });
        });</script>
    </cfif>
</cfoutput>