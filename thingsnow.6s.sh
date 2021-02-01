#!/bin/bash

# Show first task in the Today list in Things

# metadata
# <bitbar.title>Things 3 Now</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Philip Davis</bitbar.author>
# <bitbar.author.github>philipcdavis</bitbar.author.github>
# <bitbar.desc>Display first item in today view.</bitbar.desc>

function tellApp() {
	osascript -e "tell application \"Things3\"
	$1
end tell"
}

if [ "$1" = 'launch' ]; then
	tellApp 'activate'
	exit
fi

if [ "$(osascript -e 'application "Things3" is running')" = "false" ]; then
	echo " | bash='$0' image=iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII="
	exit
fi

currentlyDoing=$(tellApp 'set currentlyDoing to ""
	set todayToDos to to dos of list "Today"
	set listSize to the length of todayToDos
	if listSize >= 1 then
		set firstItem to the first item of todayToDos
		set currentlyDoing to name of firstItem as text
		return currentlyDoing
	end if
');

if [ "$currentlyDoing" != "" ]; then
	echo "$currentlyDoing | bash='$0' param1=launch terminal=false"

	else
	echo " | bash='$0' image=iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII="
fi