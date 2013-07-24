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
</cfscript>
<cfoutput>
	<plugin>
		<name>MuraGoogleCalendar</name>
		<package>MuraGoogleCalendar</package>
		<directoryFormat>packageOnly</directoryFormat>
		<loadPriority>5</loadPriority>
		<version>1.2.1</version>
		<provider>Steve Withington</provider>
		<providerURL>http://stephenwithington.com</providerURL>
		<category>Application</category>
		<settings></settings>

		<eventHandlers>
			<eventHandler 
				event="onApplicationLoad" 
				component="extensions.eventHandler" 
				persist="false" />
		</eventHandlers>

		<displayobjects location="global">
			<displayobject
				name="Mura Google Calendar"  
				component="extensions.contentRenderer"
				displaymethod="dspConfiguredMuraGoogleCalendar"
				configuratorJS="extensions/configurators/mgc/configurator.js"
				configuratorInit="initMuraGoogleCalendarConfigurator"
				persist="false" />
		</displayobjects>

		<extensions></extensions>
	</plugin>
</cfoutput>