(*
	
*)
tell application "Google Chrome"
	if active tab of front window exists then
		set active_tab to active tab of front window
		
		set js_script to "
			var selection = window.getSelection().toString();
			
			if (!selection) {
				var meta = document.getElementsByTagName('meta');
				for (var idx = 0; idx < meta.length; idx++) {
					if (meta[idx].name.toLowerCase() === 'description') {
						selection = meta[idx].content;
						break;
					}
				}
			}
			
			selection;
		"
		
		set tab_title to title of active_tab
		set tab_address to URL of active_tab
		set tab_description to execute active_tab javascript js_script
		
		tell application "Spillo"
			make new bookmark with properties {url:tab_address, title:tab_title, desc:tab_description}
			save
			refresh
		end tell
	end if
end tell
