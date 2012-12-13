/********************************************************************************
Let It Snow - A module to load and configure the Let It Snow Script provided by SnowStorm(http://www.schillmania.com/projects/snowstorm/)  to your pages
Copyright 2012 by Alagukannan Alagappan http://www.alagukannan.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Alagukannan Alagappan]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************/

component extends="coldbox.system.Interceptor" {

	//------------------------------------------------------------------------------------------------
	property name="settingService" inject="settingService@cb";
	property name="cacheBox" inject="coldbox:cacheManager";
	//------------------------------------------------------------------------------------------------
	public void function cbui_beforeHeadEnd(event, interceptData) {
	    var prc = event.getCollection(private = true);
		prc.snowSettings = {};
		
		//check if settings in coldbox cache
		if (getColdboxOCM().lookup('modules-let-it-snow-settings') eq false){
			var args = {name="LetItSnow"};
			var setting = settingService.findWhere(criteria=args);			
			if( !isNull(setting) ){
				prc.snowSettings = deserializeJson(setting.getValue());
			}else{
				prc.snowSettings = getModuleSettings("letitsnow").settings;
			}
			//save to cachebox
			getColdboxOCM().set('modules-let-it-snow-settings',prc.snowSettings,0,0);
		}else{
			prc.snowSettings = getColdboxOCM().get('modules-let-it-snow-settings');
		}	
		if (not structisEmpty(prc.snowSettings)){
			//render the cached snowstorm template
			appendToBuffer( renderview(view='settings/template',module='LetItSnow') );		
		}
	}
}
