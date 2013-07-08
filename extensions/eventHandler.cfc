/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	property name='$' hint='mura scope';

	this.pluginName = 'MuraGoogleCalendar';

	public any function onApplicationLoad(required struct $) {
		variables.pluginConfig.addEventHandler(this);
		set$(arguments.$);
	}

	public any function onSiteRequestStart(required struct $) {
		var pluginAssetPath = '#arguments.$.globalConfig('context')#/plugins/#this.pluginName#/assets';
		var contentRenderer = new contentRenderer(arguments.$);
		arguments.$.setCustomMuraScopeKey(this.pluginName, contentRenderer);

		// CfStatic
		arguments.$[this.pluginName].cfStatic = new requirements.org.cfstatic.CfStatic(
			staticDirectory = ExpandPath('#pluginAssetPath#')
			, staticURL = '#pluginAssetPath#/'
			, minifyMode = 'package'
			, checkForUpdates = !arguments.$.siteConfig('cache')
			, jsDependencyFile = ExpandPath('#pluginAssetPath#/js/dependency.info')
			, cssDependencyFile = ExpandPath('#pluginAssetPath#/css/dependency.info')
		);

		set$(arguments.$);
	}

	public any function onRenderStart(required struct $) {
		arguments.$.loadJSLib();
		variables.pluginConfig.addToHTMLHeadQueue('extensions/queues/head.cfm');
	}

}