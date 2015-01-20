tell application "Spillo"
    set content_string to ""

    set selected_bookmarks to selected bookmarks
    repeat with current_bookmark in selected_bookmarks
        set bookmark_title to title of current_bookmark
        if bookmark_title is not "" then
            set content_string to content_string & bookmark_title & return
        end if

        set bookmark_url to url of current_bookmark
        if bookmark_url is not "" then
            set content_string to content_string & bookmark_url & return
        end if

        set bookmark_desc to desc of current_bookmark
        if bookmark_desc is not "" then
            set content_string to content_string & bookmark_desc & return
        end if

        set content_string to content_string & return
    end repeat

    tell application "Mail"
        make new outgoing message with properties {visible:true, content:content_string}
    end tell
end tell
