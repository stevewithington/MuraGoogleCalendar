<cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2014 Stephen J. Withington, Jr.
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
		<version>2.0.0</version>
		<provider>Steve Withington</provider>
		<providerURL>http://stephenwithington.com</providerURL>
		<category>Application</category>
		<settings>
			<setting>
				<name>mgcAPIKey</name>
				<label>Google Calendar API Key</label>
				<hint>To use this plugin, you must first have a Google Calendar API Key. For instructions on how to obtain one, please visit http://fullcalendar.io/docs/google_calendar/</hint>
				<type>text</type>
				<required>true</required>
				<validation></validation>
				<regex></regex>
				<message>Please enter your Google Calendar API Key.</message>
				<defaultvalue></defaultvalue>
				<optionlist></optionlist>
				<optionlabellist></optionlabellist>
			</setting>
		</settings>

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