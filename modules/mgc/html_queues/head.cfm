<cfsilent><cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2018 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
local.thispath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot')));
local.modulepath = ReplaceNoCase(local.thispath, '/html_queues/', '');
</cfscript></cfsilent>
<cfoutput>
  <link rel="stylesheet" type="text/css" href="#local.modulepath#/assets/fullcalendar/fullcalendar.min.css" media="all">
  <link rel="stylesheet" type="text/css" href="#local.modulepath#/assets/fullcalendar/fullcalendar.print.min.css" media="print">
	<script>!window.jQuery && document.write(unescape('%3Cscript type="text/javascript" src="#local.modulepath#/assets/fullcalendar/lib/jquery.min.js"%3E%3C/script%3E'));</script>
  <script src="#local.modulepath#/assets/fullcalendar/lib/moment.min.js"></script>
  <script src="#local.modulepath#/assets/fullcalendar/fullcalendar.min.js"></script>
  <script src="#local.modulepath#/assets/fullcalendar/gcal.min.js"></script>
</cfoutput>