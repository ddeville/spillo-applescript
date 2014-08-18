tell application "Safari"
	if current tab of front window exists then
		set current_tab to current tab of front window
		
		set tab_title to name of current_tab
		set tab_address to URL of current_tab
		
		tell application "Spillo"
			make new bookmark with properties {url:tab_address, title:tab_title}
			save
			refresh
		end tell
	end if
end tell