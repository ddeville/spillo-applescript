(*
	
*)
display dialog "Which tag do you want to dump bookmarks in Chrome for?" default answer ""
set tag_title to text returned of result

tell application "Spillo"
	if (first tag whose title is tag_title) exists then
		set matched_tag to first tag whose title is tag_title
		set bookmark_list to the url of every bookmark in matched_tag
		
		tell application "Google Chrome"
			if not (front window exists) then
				make new window
			end if
			
			tell front window
				repeat with bookmark_url in bookmark_list
					make new tab with properties {URL:bookmark_url}
				end repeat
			end tell
		end tell
	else
		display dialog "There is no tag that matches this query."
	end if
end tell
