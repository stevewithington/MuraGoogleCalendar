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
</cfscript>
<style type="text/css">
	#bodyWrap ul > li > ol {margin-bottom: 1em;}
	#bodyWrap table th, #bodyWrap table td {vertical-align: top;}
	#bodyWrap table th, #bodyWrap table td {text-align: left;}
	#bodyWrap .code {font-family: "Courier New", Courier, monospace;}
</style>
<cfsavecontent variable="body"><cfoutput>
<div id="bodyWrap">
	<h1>#HTMLEditFormat(pluginConfig.getName())#</h1>
	<p><em>Version: #pluginConfig.getVersion()#<br />
	Author: <a href="http://stephenwithington.com" target="_blank">Steve Withington</a></em></p>

	<h2>Overview</h2>
	<p>This is a <a href="http://getmura.com">Mura CMS</a> plugin that displays events from a public Google Calendar. This plugin leverages the <a href="http://fullcalendar.io/">FullCalendar</a> <a href="http://jquery.com">jQuery</a> plugin. This allows for a much easier way for front and back end developers to visually customize the calendar as opposed to using Google's embed code.</p>

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
				<li>In the 'Calendar Address' section of the screen, you will see your Calendar ID. It will look something like <strong>abcd1234@group.calendar.google.com</strong>.</li>
			</ol>
		</li>
	</ul>

	<h3>Plugin Display Objects</h3>
	<p>There is one display object available:</p>

	<ul>
		<li><strong>Mura Google Calendar</strong>
			<ol>
				<li>Go to the <strong>Edit Content</strong> screen of a content item</li>
				<li>Select the <strong>Layout &amp; Objects</strong> tab</li>
				<li>Select <strong>Plugins</strong> from the Available Content Objects select menu</li>
				<li>Select <strong>MuraGoogleCalendar</strong> from the list of Plugins</li>
				<li>Select <strong>Mura Google Calendar</strong> and assign it to your desired display region (e.g., Left Column, Main Content, etc.)</li>
				<li>This should launch the <strong>MuraGoogleCalendar Configurator</strong> window</li>
				<li>Paste/Enter the Google Calendar's ID into the corresponding form field</li>
				<li>Click <strong>Save</strong></li>
				<li>Then, Publish your content and preview</li>
			</ol>
		</li>
	</ul>

	<h2>Designers / Developers</h2>
	<p>The 'Plugin Display Objects' may also be added directly onto your template or even dropped into a content region using <strong>[mura]</strong> tags.</p>

	<h3>Example Code</h3>

	<h4>Mura Tag Method</h4>
	<pre class="notice">[mura]$.muraGoogleCalendar.dspMuraGoogleCalendar(mgcURL='YourGoogleCalendarIDGoesHere')[/mura]</pre>

	<h4>CFML Method</h4>
	<pre class="notice">##$.muraGoogleCalendar.dspMuraGoogleCalendar(mgcURL='YourGoogleCalendarIDGoesHere')##</pre>
	

	<h4>Available Attributes</h4>
	<table class="table">
		<thead>
			<tr>
				<th>Attribute</th>
				<th>Req/Opt</th>
				<th>Default</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="code">mgcURL</td>
				<td>Required</td>
				<td class="code">&nbsp;</td>
				<td>
					<p>The full Google Calendar ID. (<em>See <a href="##gcalinfo"><strong>Google Calendar Info</strong></a></em>)</p>
					<p><em>You may also pass in multiple Google Calendar IDs as a list delimited by a semicolon ( <strong>;</strong> ).</em></p>
					<!--- <p><strong>Examples Google Calendar IDs:</strong></p>
					<ul>
						<li><strong>Geek / Nerd Holidays</strong><br>
						https://www.google.com/calendar/feeds/ka8rjt289e79lt3eilc8ii50o0@group.calendar.google.com/public/basic</li>
						<li><strong>US Holidays</strong><br>
						https://www.google.com/calendar/feeds/usa__en@holiday.calendar.google.com/public/basic</li>
					</ul> --->
				</td>
			</tr>
			<tr>
				<td class="code">mgcTimeFormat</td>
				<td>Optional</td>
				<td class="code">h(:mm)t</td>
				<td><p>Determines the time-text that will be displayed on each event.</p> 
				<p><strong>Examples:</strong><br>h(:mm)t = 5p, h:mmt = 5:00p, h:mm{ - h:mm}t = 5:00p - 6:30p, h:mm{ - h:mm} = 5:00 - 6:30, H(:mm) = 17, H:mm = 17:00, H(:mm){ - H(:mm)} = 17 - 18:30, H:mm{ - H:mm} = 17:00 - 18:30</p></td>
			</tr>
			<tr>
				<td class="code">mgcShowViewOptions</td>
				<td>Optional</td>
				<td class="code">1</td>
				<td><p>If set to <span class="code">1</span>, calendar will display the 'Day, Week, Month' buttons. Boolean.</p></td>
			</tr>
			<tr>
				<td class="code">mgcDefaultView</td>
				<td>Optional</td>
				<td class="code">month</td>
				<td><p>Determines which view the calendar will use when it is first rendered. Options: <span class="code">month, agendaWeek, agendaDay</span></p></td>
			</tr>
			<tr>
				<td class="code">mgcFirstDay</td>
				<td>Optional</td>
				<td class="code">0</td>
				<td><p>The day that each week begins. <span class="code">0=Sunday, 1=Monday, 2=Tuesday</span>, etc. This option is useful for UK users who need the week to start on Monday (<span class="code">1</span>).</p></td>
			</tr>
			<tr>
				<td class="code">mgcWeekends</td>
				<td>Optional</td>
				<td class="code">1</td>
				<td><p>Whether to include Saturday/Sunday columns in any of the calendar views. Boolean.</p></td>
			</tr>
			<tr>
				<td class="code">mgcClassName</td>
				<td>Optional</td>
				<td class="code">&nbsp;</td>
				<td><p>The CSS Class name to attach to each calendar event.</p></td>
			</tr>
			<tr>
				<td class="code">mgcWindowWidth</td>
				<td>Optional</td>
				<td class="code">800</td>
				<td><p>Event window width in pixels.</p></td>
			</tr>
			<tr>
				<td class="code">mgcWindowHeight</td>
				<td>Optional</td>
				<td class="code">500</td>
				<td><p>Event window height in pixels.</p></td>
			</tr>
			<tr>
				<td class="code">mgcColor</td>
				<td>Optional</td>
				<td class="code">##3a87ad</td>
				<td>
					<p>Sets the background <em>and</em> border colors for all events on the calendar. You can use any of the CSS color formats such as <span class="code">##f00, ##ff0000, rgb(255,0,0)</span>, or <span class="code">red</code>.</p>
					<p><strong>NOTE:</strong> If passing in multiple Google Calendar XML Feed URLs, you may also pass in multiple mgcColor values as a list delimited by a semicolor ( <strong>;</strong> ). <em>However, the length of the list must be equal to the length of the Google Calendar XML Feed URLs.</em></p>
				</td>
			</tr>
			<tr>
				<td class="code">mgcTextColor</td>
				<td>Optional</td>
				<td class="code">##fff</td>
				<td>
					<p>Sets the text colors for all events on the calendar. You can use any of the CSS color formats such as <span class="code">##f00, ##ff0000, rgb(255,0,0)</span>, or <span class="code">red</code>.</p>
					<p><strong>NOTE:</strong> If passing in multiple Google Calendar XML Feed URLs, you may also pass in multiple mgcTextColor values delimited by a semicolor ( <strong>;</strong> ). <em>However, the length of the list must be equal to the length of the Google Calendar XML Feed URLs.</em></p>
				</td>
			</tr>
		</tbody>
	</table>

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

	<blockquote><a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></blockquote>

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