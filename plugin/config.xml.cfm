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
		<version>1.0.0</version>
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
				configuratorInit="init"
				persist="false" />
		</displayobjects>

		<extensions>
			<extension type="Calendar" subType="MuraGoogleCalendar" availableSubTypes="">
				<attributeset name="MuraGoogleCalendar Options" container="Basic">

					<attribute 
						name="mgcurl"
						label="Google Calendar XML Feed URL"
						hint="(Required) Paste the Google Calendar's XML Feed URL here. See the plugin instructions on how to obtain the XML Feed URL."
						type="text"
						defaultValue=""
						required="true"
						validation=""
						regex=""
						message="Please enter the XML Feed URL for the Google Calendar"
						optionList=""
						optionLabelList="" />

					<attribute 
						name="mgcclassname"
						label="CSS Class Name"
						hint="(Optional) CSS class to attach to each event for this calendar"
						type="text"
						defaultValue=""
						required="false"
						validation=""
						regex=""
						message=""
						optionList=""
						optionLabelList="" />

					<!--- 
						Other potential attributes to be implemented in a future version:
						* color
						* backgroundColor
						* borderColor
						* textColor
					--->

				</attributeset>
			</extension><!--- /END Calendar/MuraGoogleCalendar --->
		</extensions>

	</plugin>
</cfoutput>