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
</cfscript></cfsilent>
<cfoutput>
	<script>!window.jquery && document.write('<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"><\/script>');</script>
	#$.MuraGoogleCalendar.cfStatic.renderIncludes()#
</cfoutput>