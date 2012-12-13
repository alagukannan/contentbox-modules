<!---
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
--->
<cfoutput>
<script type="text/javascript" src="#event.getModuleRoot('LetItSnow')#/includes/js/snowstorm.min.js"></script>
<script type="text/javascript">
snowStorm.autoStart = #prc.snowSettings.autoStart#;
snowStorm.snowColor = '#prc.snowSettings.snowColor#';
snowStorm.flakeBottom = #prc.snowSettings.flakeBottom#;
snowStorm.followMouse = #prc.snowSettings.followMouse#;
snowStorm.animationInterval = #prc.snowSettings.animationInterval#;
snowStorm.usePositionFixed = #prc.snowSettings.usePositionFixed#;
snowStorm.excludeMobile = #prc.snowSettings.excludeMobile#;
snowStorm.snowStick = #prc.snowSettings.snowStick#;
snowStorm.useMeltEffect = #prc.snowSettings.useMeltEffect#;
snowStorm.flakeLeftOffset = #prc.snowSettings.flakeLeftOffset#;
snowStorm.freezeOnBlur = #prc.snowSettings.freezeOnBlur#;
snowStorm.flakesMaxActive = #prc.snowSettings.flakesMaxActive#;
snowStorm.flakesMax = #prc.snowSettings.flakesMax#;
snowStorm.vMaxX = #prc.snowSettings.vMaxX#;
snowStorm.vMaxY = #prc.snowSettings.vMaxY#;
snowStorm.targetElement = #prc.snowSettings.targetElement#;
snowStorm.flakeHeight = #prc.snowSettings.flakeHeight#;
snowStorm.flakeRightOffset = #prc.snowSettings.flakeRightOffset#;
snowStorm.useTwinkleEffect = #prc.snowSettings.useTwinkleEffect#;
snowStorm.flakeWidth = #prc.snowSettings.flakeWidth#;
</script>
</cfoutput>