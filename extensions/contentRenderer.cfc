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

	property name='$' hint='mura scope';

	public any function init(required struct $) {
		set$(arguments.$);
		return this;
	}

	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */

	public any function getDefaultParams(struct $=get$()) {
		return {
			mgcurl = ''
			, mgctimeformat = 'h(:mm)t'
			, mgcshowviewoptions = '1'
			, mgcdefaultview = 'month'
			, mgcfirstday = '0'
			, mgcweekends = '1'
			, mgcclassname = ''
			, mgcwindowwidth = '800'
			, mgcwindowheight = '500'
			, mgccolor = ''
			, mgctextcolor = ''
			, mgcid = Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)
			, $ = arguments.$
		};
	}

	// public string function dspMuraGoogleCalendar(
	// 	mgcurl=''
	// 	, mgctimeformat='h(:mm)t'
	// 	, mgcshowviewoptions='1'
	// 	, mgcdefaultview='month'
	// 	, mgcfirstday='0'
	// 	, mgcweekends='1'
	// 	, mgcclassname=''
	// 	, mgcwindowwidth='800'
	// 	, mgcwindowheight='500'
	// 	, mgccolor=''
	// 	, mgctextcolor=''
	// 	, mgcid='#Right(LCase(REReplace(CreateUUID(), '-', '', 'all')),11)#'
	// 	, $=get$()
	// ) {
	public string function dspMuraGoogleCalendar(argumentCollection=getDefaultParams()) {
		var local = {};
		if ( !Len(Trim(arguments.mgcurl)) ) { return ''; }

		local.tracePoint = arguments.$.initTracePoint('MuraGoogleCalendar.extensions.contentRenderer.cfc:dspMuraGoogleCalendar()');

		// Custom RB Factory
		local.rb = getResourceBundleFactory(arguments.$);

		savecontent variable='local.str' {
			include 'display_objects/MuraGoogleCalendar.cfm';
		}

		arguments.$.commitTracePoint(local.tracePoint);
		return local.str;
	}

	public any function dspConfiguredMuraGoogleCalendar(required struct $) {
		var local = {};
		local.params = arguments.$.event('objectParams');
		local.defaultParams = getDefaultParams($);
		StructAppend(local.params, local.defaultParams, false);
		local.str = dspMuraGoogleCalendar(argumentCollection=local.params);
		return local.str;
	}

	public any function getResourceBundleFactory(required struct $) {
		var resourceDirectory = ExpandPath('#$.globalConfig('context')#/plugins/MuraGoogleCalendar/extensions/resourceBundles/');
		return new mura.resourceBundle.resourceBundleFactory(
			parentFactory = arguments.$.siteConfig('rbFactory')
			, resourceDirectory = resourceDirectory
			, locale = $.siteConfig('JavaLocale')
		);
	}

}