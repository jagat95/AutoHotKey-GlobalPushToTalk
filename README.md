# AutoHotKey-GlobalPushToTalk

#### This helps to keep mic disabled globally and have a constant push to talk throughout system. 

> Really useful when voice applications like ``Teamspeak, Discord`` misbehave when full screen application is active (rare cases).

> You have Meeting app like ``Microsoft Teams`` which doesnt have dedicated Push to Talk yet.

> You have a online multiplayer game with voice chat but it does not support Push To Talk controlled keys.

### History

I was playing a game called Remnant From The Ashes and for some reason Teamspeak was not detecting push to talk key (capslock). 
So after extreme research I stumbled upon AutoHotKey which really works well to create small tools for your windows experience and can trigger actions on various key events with full scripting support

### Dependencies & Installation

Requires **AutoHotKey** to be installed. You can get from here (https://www.autohotkey.com/)

__To Install__
1. Download and install ``AutoHotKey`` (I used live non-beta version)
2. Make sure to successfuly install and restart the system
3. Save the script from repo as **filename.ahk** (you can give any file name)
4. Right click on script (ahk file) and from context menu select ``"Compile Script"``
    - the above step should generate a .exe file, if not some compilation error must have occured 
5. Before running .exe goto Windows System Sounds -> Select your audio device -> Set Volume to **97** -> Click Ok and close the sound settings.
    - The device with volume set as **97** will be selected to be muted with the push to talk key
6. Run the application & check status of it by hovering over it in system tray.

  - Additionally after running the application you can find it in System Tray. On Mouse Hover It will show you the master device Id and Selected volume e.g. 11 97
  - There is option to exit the application by right clicking from tray icon & Exit
  - There is also option to restart. This is again personal use case where some of my devices was getting muted. Essentially I added option to unmute everything and mute back the selected Audio device in Step 5.

### Errors & Issues
- If you encounter key not detecting or conflicting with other stuff please remember. **This application need to be run as admin to function properly**
- Also the current key in script is Caps Lock and that key gets disabled completely once this script is running in background. This behaviour can be changed but I like it this way currently.

### Support
This script I wrote for personal usage and therefore hasnt been generalized for customisation etc. nor it is written with clean code in mind. 

I'll probably update it if future to improve code structure and performance improvement.

It is relatively easy to edit to your use case, but feel free to ask if you are going to utlize this and need any help to setup/edit/run this.

