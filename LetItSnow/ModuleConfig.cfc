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


component hint="Let It Snow"{

	// Module Properties
	this.title 			    = "Let it Snow";
	this.author 			= "Alagukannan Alagappan";
	this.webURL 			= "http://www.alagukannan.com";
	this.description 		= "A module to load and configure the Let It Snow Script provided by <a <a href='http://www.schillmania.com/projects/snowstorm/'>SnowStorm</a>  to your pages";
	this.version			= "1.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "LetItSnow";


	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	function configure() {

		// parent settings
		parentSettings = {};

		// module settings - stored in modules.name.settings
		settings = {
		  autoStart = true,          // Whether the snow should start automatically or not.
		  flakesMax = 128,           // Limit total amount of snow made (falling + sticking)
		  flakesMaxActive = 64,      // Limit amount of snow falling at once (less = lower CPU use)
		  animationInterval = 33,    // Theoretical "miliseconds per frame" measurement. 20 = fast + smooth, but high CPU use. 50 = more conservative, but slower
		  excludeMobile = true,      // Snow is likely to be bad news for mobile phones' CPUs (and batteries.) By default, be nice.
		  flakeBottom = 0,        // Integer for Y axis snow limit, 0 or null for "full-screen" snow effect
		  followMouse = true,        // Snow movement can respond to the user's mouse
		  snowColor = '##fff',        // Don't eat (or use?) yellow snow.
		  //snowCharacter = '&bull,',  // &bull, = bullet, &middot, is square on some systems etc.
		  snowStick = true,          // Whether or not snow should "stick" at the bottom. When off, will never collect.
		  targetElement = 'document.body',      // element which snow will be appended to (null = document.body) - can be an element ID eg. 'myDiv', or a DOM node reference
		  useMeltEffect = true,      // When recycling fallen snow (or rarely, when falling), have it "melt" and fade out if browser supports it
		  useTwinkleEffect = false,  // Allow snow to randomly "flicker" in and out of view while falling
		  usePositionFixed = false,  // true = snow does not shift vertically when scrolling. May increase CPU load, disabled by default - if enabled, used only where supported

		  // --- less-used bits ---
		  freezeOnBlur = true,       // Only snow when the window is in focus (foreground.) Saves CPU.
		  flakeLeftOffset = 0,       // Left margin/gutter space on edge of container (eg. browser window.) Bump up these values if seeing horizontal scrollbars.
		  flakeRightOffset = 0,      // Right margin/gutter space on edge of container
		  flakeWidth = 8,            // Max pixel width reserved for snow element
		  flakeHeight = 8,           // Max pixel height reserved for snow element
		  vMaxX = 5,                 // Maximum X velocity range for snow
		  vMaxY = 4                 // Maximum Y velocity range for snow
		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {};

		// web services
		webservices = {};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Custom Declared Points
		interceptorSettings = {
		};

		// Custom Declared Interceptors
		interceptors = [
			{class="#moduleMapping#.interceptors.letItSnow", name="letItSnow@snow"}
		];
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is registered and activated.
	//------------------------------------------------------------------------------------------------
	function onLoad() {
			// ContentBox unloading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's add ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Add Menu Contribution
			menuService.addSubMenu(topMenu = menuService.MODULES, name = "LetItSnow", label = "Let It Snow", href = "#menuService.buildModuleLink('LetItSnow','settings')#");	
		}
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is activated by ContentBox
	//------------------------------------------------------------------------------------------------
	function onActivate() {
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// store default settings
		var args = {name="LetItSnow", value=serializeJSON( settings )};
		var snowSettings = settingService.new(properties=args);
		settingService.save( snowSettings );		
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is unregistered and unloaded
	//------------------------------------------------------------------------------------------------
	function onUnload() {
		// ContentBox unloading
		if( structKeyExists( controller.getSetting("modules"), "contentbox" ) ){
			// Let's remove ourselves to the main menu in the Modules section
			var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
			// Remove Menu Contribution
			menuService.removeSubMenu(topMenu=menuService.MODULES,name="LetItSnow");
		}
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is deactivated by ContentBox
	//------------------------------------------------------------------------------------------------
	function onDeactivate() {
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="LetItSnow"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			settingService.delete( setting );
		}
	}

}