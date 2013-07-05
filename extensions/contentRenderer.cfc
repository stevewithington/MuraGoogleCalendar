/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.cfobject' output=false {

	property name='$';

	public any function init(required struct $) {
		set$(arguments.$);
		return this;
	}

	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */

	public string function dspMuraGoogleCalendar(
		mgcurl=''
		, mgcclassname=''
		, $=get$()
	) {
		var local = {};
		if ( !Len(Trim(arguments.mgcurl)) ) { return ''; }
		//local.arrURLs = ListToArray(arguments.mgcurl, '^');
		//local.arrClassNames = ListToArray(arguments.mgcclassname, '^');
		//if ( ArrayLen(local.arrURLs) != ArrayLen(local.arrClassNames) ) { return 'URLs and ClassNames do not match.'; }
		savecontent variable='local.str' {
			include 'display_objects/MuraGoogleCalendar.cfm';
		}
		return local.str;
	}

	public any function dspConfiguredMuraGoogleCalendar(required struct $) {
		var local = {};
		local.params = arguments.$.event('objectParams');
		local.defaultParams = {
			mgcurl = ''
			, mgcclassname = ''
			, $ = arguments.$
		};
		StructAppend(local.params, local.defaultParams, false);
		local.str = dspMuraGoogleCalendar(argumentCollection=local.params);
		return local.str;
	}

}