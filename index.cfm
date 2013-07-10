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
<style type="text/css">
	#bodyWrap h3{padding-top:1em;}
	#bodyWrap ul{padding:0 0.75em;margin:0 0.75em;}
</style>
<cfsavecontent variable="body"><cfoutput>
<div id="bodyWrap">
	<h1>#HTMLEditFormat(pluginConfig.getName())#</h1>

	<p>This is a [Mura CMS](http://getmura.com) plugin that displays events from a public Google Calendar.</p>
	<p>This plugin leverages the [FullCalendar](http://arshaw.com/fullcalendar/) [jQuery](http://jquery.com) plugin. This allows for a much easier way for front and back end developers to visually customize the calendar as opposed to using Google's embed code.</p>

	<h2>Instructions</h2>

	<h3>You must first make your Google Calendar public</h3>
	<ol>
		<li>In the Google Calendar interface, locate the &quot;My Calendar&quot; box on the left.</li>
		<li>Click the arrow next to the calendar you need.&quot;</li>
		<li>A menu will appear. Click &quot;Share this calendar.</li>
		<li>Check &quot;Make this calendar public.&quot;</li>
		<li>Make sure &quot;Share only my free/busy information&quot; is **unchecked**.</li>
		<li>Click &quot;Save.&quot;</li>
	</ol>

	<h3>Then, you must obtain your calendar's XML Feed URL</h3>
	<ol>
		<li>In the Google Calendar instance, locate the &quot;My Calendar&quot; box on the left.</li>
		<li>Click the arrow next to the calendar you need.</li>
		<li>A menu will appear. Click &quot;Calendar settings.&quot;</li>
		<li>In the &quot;Calendar Address&quot; section of the screen, click the XML badge.</li>
		<li>Your XML Feed's URL will appear. Copy it!</li>
	</ol>

	<h3>Place MuraGoogleCalendar</h3>
	<p>There are a few ways to add a MuraGoogleCalendar to your content:</p>

	<h4>As a Display Object</h4>
	<ul>
		<li><strong>Via the User Interface</strong>
			<ol>
				<li>Go to the &quot;Edit Content&quot; screen of a content item</li>
				<li>Select the &quot;Layout &amp; Objects&quot; tab</li>
				<li>Select &quot;Plugins&quot; from the Available Content Objects select menu</li>
				<li>Select &quot;MuraGoogleCalendar&quot; from the list of Plugins</li>
				<li>Select &quot;Mura Google Calendar&quot; and assign it to your desired display region (e.g., Left Column, Main Content, etc.)</li>
				<li>This should launch the &quot;MuraGoogleCalendar Configurator&quot; window</li>
				<li>Paste/Enter the Google Calendar's XML Feed URL into the corresponding form field</li>
				<li>Click &quot;Save&quot;</li>
				<li>Then, Publish your content and preview</li>
			</ol>
		</li>

		<li><strong>Via [mura] Tags</strong>
			<pre class="notice">##$.muraGoogleCalendar.dspMuraGoogleCalendar(mgcURL='YourGoogleCalendarXMLFeedURLGoesHere')##</pre>
			<p>Available Attributes:</p>
			<ul>
				<li><strong>mgcURL</strong><br>
				<em>(Required)</em> The full Google Calendar XML Feed URL.
				</li>
				<li><strong>mgcClassName</strong><br>
				<em>(Optional)</em> The CSS Class name to attach to each calendar event.
				</li>
			</ul>
		</li>
	</ul>

	<h3>Tested With</h3>
	<ul>
		<li>Mura CMS Core Version <strong>6.0+</strong></li>
		<li>Adobe ColdFusion <strong>10.0.10</strong></li>
		<li>Railo <strong>4.0.4</strong></li>
	</ul>

	<h3>Need help?</h3>
	<p>If you're running into an issue, please let me know at <a href="https://github.com/stevewithington/#HTMLEditFormat(pluginConfig.getPackage())#/issues">https://github.com/stevewithington/#HTMLEditFormat(pluginConfig.getPackage())#/issues</a> and I'll try to address it as soon as I can.</p>
	
	<p>Cheers!<br />
	<a href="http://stephenwithington.com">Steve Withington</a></p>
</div>
</cfoutput></cfsavecontent>
<cfoutput>
	#$.getBean('pluginManager').renderAdminTemplate(
		body = body
		, pageTitle = ''
		, jsLib = 'jquery'
		, jsLibLoaded = false
	)#
</cfoutput>