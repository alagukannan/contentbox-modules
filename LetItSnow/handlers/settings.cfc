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


component{

	// DI
	property name="settingService" inject="settingService@cb";
	property name="cb" inject="cbHelper@cb";

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public function preHandler(event, action, eventArguments) {
		var rc 	= event.getCollection();
		var prc = event.getCollection(private = true);
	}

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public void function index(event,rc,prc){	
		prc.xehSave = cb.buildModuleLink("LetItSnow","settings.save"); // Exit handler
		prc.tabModules_letitsnow = true;
		var args = {name="LetItSnow"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			prc.settings = deserializeJson(setting.getValue());
		}	
		event.setView("settings/index");
	}

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public function save(event, rc, prc) {
		// Probably should not be here, and should be in the service but its here for now.
		for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			prc.settings[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
		}
		// Save settings
		var args = {name="LetItSnow"};
		var setting = settingService.findWhere(criteria=args);
		setting.setValue( serializeJSON( prc.settings ) );
		settingService.save( setting );
		//save to cachebox
		getColdboxOCM().set('modules-let-it-snow-settings',event.getValue(name='settings',private=true,defaultValue={}),0,0);
		// Messagebox
		getPlugin("MessageBox").info("Settings Saved & Updated!");
		setNextEvent('cbadmin.module.LetItSnow.settings');
	}
}