/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
function initMuraGoogleCalendarConfigurator(data) {

	initConfigurator(data,{
		url: '../plugins/MuraGoogleCalendar/extensions/configurators/mgc/configurator.cfm'
		, pars: ''
		, title: 'Mura Google Calendar'
		, init: function(){}
		, destroy: function(){}
		, validate: function(){
			// simple js validation
			if ( !jQuery('#mgcurl').val() ) {
				var response = alert('Google Calendar XML Feed URL is required.');
				return false;
			}
			return true;
		}
	});

	return true;

};