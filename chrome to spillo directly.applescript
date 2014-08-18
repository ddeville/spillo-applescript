(*
	
*)
tell application "Google Chrome"
	if active tab of front window exists then
		set active_tab to active tab of front window
		
		set tab_title to title of active_tab
		set tab_address to URL of active_tab
		
		tell application "Spillo"
			make new bookmark with properties {url:tab_address, title:tab_title}
			save
			refresh
		end tell
	end if
end tell