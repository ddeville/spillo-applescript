(*
	
*)
tell application "Safari"
	if current tab of front window exists then
		set current_tab to current tab of front window
		
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
		
		set tab_title to name of current_tab
		set tab_address to URL of current_tab
		set tab_description to do JavaScript js_script in current_tab
		
		tell application "Spillo"
			show create bookmark panel with properties {url:tab_address, title:tab_title, desc:tab_description}
		end tell
	end if
end tell