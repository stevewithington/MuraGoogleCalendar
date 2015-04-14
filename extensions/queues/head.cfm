<cfsilent><cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2015 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
</cfscript></cfsilent>
<cfoutput>
	<script>!window.jquery && document.write('<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"><\/script>');</script>
  <script src="#$.event('pluginPath')#assets/js/min/muragooglecalendar.min.js"></script>
  <link rel="stylesheet" type="text/css" href="#$.event('pluginPath')#assets/css/min/muragooglecalendar.min.css">
</cfoutput>