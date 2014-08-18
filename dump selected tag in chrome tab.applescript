(*
	
*)
tell application "Spillo"
	if selected tag exists then
		set bookmark_list to the url of every bookmark in selected tag
		
		tell application "Google Chrome"
			if not (front window exists) then
				make new document
			end if
			
			tell front window
				repeat with bookmark_url in bookmark_list
					make new tab with properties {URL:bookmark_url}
				end repeat
			end tell
		end tell
	else
		display dialog "There is no tag currently selected in Spillo."
	end if
end tell
