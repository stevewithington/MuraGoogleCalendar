/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2018 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	this.pluginName = 'MuraGoogleCalendar';

	public any function onApplicationLoad(required struct m) {
		variables.pluginConfig.addEventHandler(this);
	}

	public any function onRenderStart(required struct m) {
		arguments.m.loadJSLib();
		variables.pluginConfig.addToHTMLHeadQueue('modules/mgc/html_queues/head.cfm');
	}

}