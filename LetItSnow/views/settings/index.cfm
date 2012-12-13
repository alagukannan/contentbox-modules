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
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/info.png" alt="info" width="24" height="24" />Need Help?
		</div>
		<div class="body">
			<p>
				<strong>Let It Snow</strong> - A module to load and configure the Let It Snow Script provided by <a href="http://www.schillmania.com/projects/snowstorm/">SnowStorm</a> to your pages.
			</p>
		</div>
	</div>
	<div class="small_box expose">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/info.png" alt="info" width="24" height="24" />Other Contributions
		</div>
		<div class="body">
			<p>
				Here are by other contribution to Coldbox Community which can be downloaded from ForgeBox.
			</p>
			<ul>
				<li><a href="http://www.coldbox.org/forgebox/view/Aggregator">Aggregator Module</a></li>
				<li><a href="http://www.coldbox.org/forgebox/view/reCAPTCHA">reCaptch Plugin</a></li>
				<li><a href="http://www.coldbox.org/forgebox/view/Google-URL-Shortener">Google URL Shortner Plugin</a></li>
				<li><a href="http://www.coldbox.org/forgebox/view/QRCodeGenerator">QR Code generator Plugin</a></li>
				<li><a href="http://www.coldbox.org/forgebox/view/Maintenance-Mode">Maintenance Mode Interceptor</a></li>
			</ul>
		</div>
	</div>
</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			Let it Snow Settings
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#
			#html.startForm(action=prc.xehSave,name="settingsForm")#

			<div class="body_vertical_nav clearfix">
				<div class="main_column">
				<!-- Content area that wil show the form and stuff -->
				<div class="panes_vertical">

				<!--- Settings --->
				<div>
				<fieldset>
				<legend><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> <strong>Settings</strong></legend>
					<p>From here you can tune the HTML Compression Engine.</p>

					<!--- Auto Start --->
					#html.hiddenField(name="autoStart",value=prc.settings.autoStart,value=true)#
					
					<!--- excludeMobile --->
					#html.label(field="excludeMobile",content="Snow is likely to be bad news for mobile phones' CPUs (and batteries.) By default, be nice:")#
					#html.radioButton(name="excludeMobile",checked=prc.settings.excludeMobile,value=true)# Yes
					#html.radioButton(name="excludeMobile",checked=not prc.settings.excludeMobile,value=false)# No

					<!--- followMouse --->
					#html.label(field="followMouse",content="Snow movement can respond to the user's mouse:")#
					#html.radioButton(name="followMouse",checked=prc.settings.followMouse,value=true)# Yes
					#html.radioButton(name="followMouse",checked=not prc.settings.followMouse,value=false)# No

					<!--- snowStick --->
					#html.label(field="snowStick",content="Whether or not snow should 'stick' at the bottom. When off, will never collect:")#
					#html.radioButton(name="snowStick",checked=prc.settings.snowStick,value=true)# Yes
					#html.radioButton(name="snowStick",checked=not prc.settings.snowStick,value=false)# No

					<!--- useMeltEffect --->
					#html.label(field="useMeltEffect",content="When recycling fallen snow (or rarely, when falling), have it 'melt' and fade out if browser supports it:")#
					#html.radioButton(name="useMeltEffect",checked=prc.settings.useMeltEffect,value=true)# Yes
					#html.radioButton(name="useMeltEffect",checked=not prc.settings.useMeltEffect,value=false)# No

					<!--- useTwinkleEffect --->
					#html.label(field="useTwinkleEffect",content="Allow snow to randomly 'flicker' in and out of view while falling:")#
					#html.radioButton(name="useTwinkleEffect",checked=prc.settings.useTwinkleEffect,value=true)# Yes
					#html.radioButton(name="useTwinkleEffect",checked=not prc.settings.useTwinkleEffect,value=false)# No

					<!--- usePositionFixed --->
					#html.label(field="usePositionFixed",content="snow does not shift vertically when scrolling. May increase CPU load:")#
					#html.radioButton(name="usePositionFixed",checked=prc.settings.usePositionFixed,value=true)# Yes
					#html.radioButton(name="usePositionFixed",checked=not prc.settings.usePositionFixed,value=false)# No

					<!--- freezeOnBlur --->
					#html.label(field="freezeOnBlur",content="Only snow when the window is in focus (foreground.) Saves CPU:")#
					#html.radioButton(name="freezeOnBlur",checked=prc.settings.freezeOnBlur,value=true)# Yes
					#html.radioButton(name="freezeOnBlur",checked=not prc.settings.freezeOnBlur,value=false)# No
					
					<label for="flakesMax">Maximum Flakes</label>		
					<small>Limit total amount of snow made (falling + sticking)</small><br/>
					#html.textField(name="flakesMax",value=prc.settings.flakesMax,size=40,class="textfield",required=true)#
					
					<label for="flakesMaxActive">Maximum Flakes Active</label>		
					<small>Limit amount of snow falling at once (less = lower CPU use)</small><br/>
					#html.textField(name="flakesMaxActive",value=prc.settings.flakesMaxActive,size=40,class="textfield",required=true)#

					<label for="animationInterval">Animation Interval</label>		
					<small>Theoretical "miliseconds per frame" measurement. 20 = fast + smooth, but high CPU use. 50 = more conservative, but slower</small><br/>
					#html.textField(name="animationInterval",value=prc.settings.flakesMaxActive,size=40,class="textfield",required=true)#

					<label for="flakeBottom">Flake Bottom</label>		
					<small>Integer for Y axis snow limit, 0 or null for "full-screen" snow effect</small><br/>
					#html.textField(name="flakeBottom",value=prc.settings.flakeBottom,size=40,class="textfield",required=true)#

					<!---
					<label for="snowCharacter">Snow Character</label>		
					<small>&bull, = bullet, &middot, is square on some systems etc.</small><br/>
					#html.textField(name="snowCharacter",value=prc.settings.snowCharacter,size=40,class="textfield",required=true)#
					--->
					<label for="snowColor">Snow Color</label>		
					<small>Don't eat (or use?) yellow snow</small><br/>
					#html.textField(name="snowColor",value=prc.settings.snowColor,size=40,class="textfield",required=true)#
	
					<label for="targetElement">Target Element</label>		
					<small>element which snow will be appended to (null = document.body) - can be an element ID eg. 'myDiv', or a DOM node reference</small><br/>
					#html.textField(name="targetElement",value=prc.settings.targetElement,size=40,class="textfield",required=true)#

					<label for="flakeLeftOffset">Flake LeftOffset</label>		
					<small>Left margin/gutter space on edge of container (eg. browser window.) Bump up these values if seeing horizontal scrollbars</small><br/>
					#html.textField(name="flakeLeftOffset",value=prc.settings.flakeLeftOffset,size=40,class="textfield",required=true)#

					<label for="flakeRightOffset">Flake RightOffset</label>		
					<small>Right margin/gutter space on edge of container</small><br/>
					#html.textField(name="flakeRightOffset",value=prc.settings.flakeRightOffset,size=40,class="textfield",required=true)#
					
					<label for="flakeWidth">Max pixel width</label>		
					<small>Max pixel width reserved for snow element</small><br/>
					#html.textField(name="flakeWidth",value=prc.settings.flakeWidth,size=40,class="textfield",required=true)#
					

					
					<label for="flakeHeight">Max pixel height</label>		
					<small>Max pixel height reserved for snow element</small><br/>
					#html.textField(name="flakeHeight",value=prc.settings.flakeHeight,size=40,class="textfield",required=true)#
					
					<label for="vMaxX">vMaxX</label>		
					<small>Maximum X velocity range for snow</small><br/>
					#html.textField(name="vMaxX",value=prc.settings.vMaxX,size=40,class="textfield",required=true)#		

					<label for="vMaxX">vMaxY</label>		
					<small>Maximum Y velocity range for snow/small><br/>
					#html.textField(name="vMaxY",value=prc.settings.vMaxY,size=40,class="textfield",required=true)#							
				</fieldset>
				</div>

				</div> <!--- end vertical panes --->
				</div> <!--- end main_column --->

			</div> <!--- End vertical nav --->

			<!--- Submit --->
			<div class="actionBar center">
				#html.submitButton(value="Save Settings",class="buttonred",title="Save the Let It Snow settings")#
			</div>

			#html.endForm()#

		</div>
	</div>
</div>
</cfoutput>