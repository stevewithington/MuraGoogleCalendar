<cfscript>
/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2018 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
</cfscript>
<style type="text/css">
	#mgc-bodywrapper h2 {margin-top: 1em; font-size: 22px;}
	#mgc-bodywrapper h3 {font-size: 16px;}
	#mgc-bodywrapper p {margin-bottom: 1em !important;}
	#mgc-bodywrapper ul {padding-left: 1.25em;}
	#mgc-bodywrapper ul > li > ol {margin-bottom: 1em;}
	#mgc-bodywrapper table th, #mgc-bodywrapper table td {vertical-align: top;}
	#mgc-bodywrapper table th, #mgc-bodywrapper table td {text-align: left;}
	#mgc-bodywrapper .code {font-family: "Courier New", Courier, monospace;}
</style>
<cfsavecontent variable="body"><cfoutput>
<div id="mgc-bodywrapper">
	<h1>#HTMLEditFormat(pluginConfig.getName())#</h1>
	<p><em>Version: #pluginConfig.getVersion()#<br />
	Author: <a href="http://stephenwithington.com" target="_blank">Steve Withington</a></em></p>

	<h2>Overview</h2>
	<p>This is a <a href="http://getmura.com">Mura</a> plugin that displays events from a public Google Calendar. This plugin leverages the <a href="http://fullcalendar.io/">FullCalendar</a> <a href="http://jquery.com">jQuery</a> plugin. This allows for a much easier way for developers to visually customize the calendar as opposed to using Google's embed code.</p>

	<h2>Instructions</h2>

	<a name="gcalinfo"></a>
	<h3>Make Your Google Calendar(s) Public</h3>
	<ul>
		<li>
			<p><strong>Any Google Calendar(s) you wish to use with this plugin, must be made public:</strong></p>
			<ol>
				<li>In the Google Calendar interface, locate the 'My Calendars' area on the left.</li>
				<li>Hover over the calendar you need and click the downward arrow.</li>
				<li>A menu will appear. Click 'Share this Calendar'.</li>
				<li>Check 'Make this calendar public'.</li>
				<li>Make sure 'Share only my free/busy information' is <strong>unchecked</strong>.</li>
				<li>Click 'Save'.</li>
			</ol>
		</li>
		<li>
			<p><strong>Obtain Your Google Calendar's ID</strong></p>
			<ol>
				<li>In the Google Calendar interface, locate the 'My calendars' area on the left.</li>
				<li>Hover over the calendar you need and click the downward arrow.</li>
				<li>A menu will appear. Click 'Calendar settings'.</li>
				<li>In the 'Integrate Calendar' section of the screen, you will see your <strong>Calendar ID</strong>. It will look something like <strong>abcd1234@group.calendar.google.com</strong>.</li>
			</ol>
		</li>
	</ul>

	<h3>Plugin Module</h3>
	<p>There is one module available:</p>

	<ul>
		<li><strong>MuraGoogleCalendar</strong>
			<ol>
				<li>From the front-end view of your site, navigate to the desired content item you wish to place your calendar on.</li>
				<li>Select <strong>Inline Edit</strong>.</li>
				<li>From the display object panel, select <strong>MuraGoogleCalendar</strong> and drag &amp; drop the object into your desired display area.</li>
				<li>This should launch the <strong>MuraGoogleCalendar Configurator</strong> panel.</li>
				<li>Paste/Enter the Google Calendar's ID into the corresponding form field, and modify any of the other available settings as desired.</li>
				<li>When finished, on the front-end toolbar, hover over the <strong>Save</strong> button and select your desired publishing option.</li>
			</ol>
		</li>
	</ul>

	<h2>Tested With</h2>
	<ul>
		<li>Mura CMS Core Version <strong>7.1+</strong></li>
		<li>Adobe ColdFusion <strong>2016+</strong></li>
		<li>Lucee <strong>5+</strong></li>
	</ul>

	<h2>Need help?</h2>
	<p>If you're running into an issue, please let me know at <a href="https://github.com/stevewithington/#HTMLEditFormat(pluginConfig.getPackage())#/issues">https://github.com/stevewithington/#HTMLEditFormat(pluginConfig.getPackage())#/issues</a> and I'll try to address it as soon as I can.</p>
	
	<p>Cheers!<br />
	<a href="http://stephenwithington.com">Steve Withington</a></p>

	<h2>License</h2>
	<p>Copyright 2013<cfif Year(Now()) neq 2013>-#Year(Now())#</cfif> Stephen J. Withington, Jr.</p>
	<p>Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:</p>

	<p><a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></p>

	<p>Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.</p>
</div>
</cfoutput></cfsavecontent>
<cfoutput>
	#$.getBean('pluginManager').renderAdminTemplate(
		body = body
		, pageTitle = pluginConfig.getName()
		, jsLib = 'jquery'
		, jsLibLoaded = false
	)#
</cfoutput>