/**
* 
* This file is part of MuraGoogleCalendar
*
* Copyright 2013-2018 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.cfobject' output=false {

    function init() {
        var thispath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(application.configBean.get('webroot')));
        var modulepath = Left(thispath, Len(thispath)-Len('/model/handlers/'));
        set('modulepath', modulepath);
        return this;
    }

	public any function onRenderStart(required struct m) {
		var pluginConfig = m.getBean('pluginManager').getConfig('MuraGoogleCalendar');
		pluginConfig.addToHTMLHeadQueue('modules/mgc/html_queues/head.cfm');
	}

}