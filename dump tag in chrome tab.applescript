display dialog "Which tag do you want to dump bookmarks in Chrome for?" default answer ""
set searched_tag to text returned of result

tell application "Spillo"
	set bookmark_url_list to the url of every bookmark whose tagged contains searched_tag
	
	tell application "Google Chrome"
		if not (front window exists) then
			make new window
		end if
		
		tell front window
			repeat with bookmark_url in bookmark_url_list
				make new tab with properties {URL:bookmark_url}
			end repeat
		end tell
	end tell
end tell