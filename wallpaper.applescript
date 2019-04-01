(* Slightly modified from https://tuttologico.altervista.org/wallpaper-per-ogni-mese/ *)
script MyScript
	--Folder names
	set jan to "january"
	set feb to "february"
	set mar to "march"
	set apr to "april"
	set maym to "may"
	set jun to "june"
	set jul to "july"
	set aug to "august"
	set sep to "september"
	set oct to "october"
	set nov to "november"
	set dec to "december"
	
	-- set to true to display the same image on all desktops, false to show unique images on each desktop
	set useSamePictureAcrossDisplays to true
	
	
	-- get current month
	set m to month of (current date)
	
	-- set default currentMonth
	set currentMonth to m
	
	-- change value of currentMonth based on current data
	if (m is equal to "january") then
		set currentMonth to jan
	else if (m is equal to "february") then
		set currentMonth to feb
	else if (m is equal to "march") then
		set currentMonth to mar
	else if (m is equal to "april") then
		set currentMonth to apr
	else if (m is equal to "may") then
		set currentMonth to maym
	else if (m is equal to "june") then
		set currentMonth to jun
	else if (m is equal to "july") then
		set currentMonth to jul
	else if (m is equal to "august") then
		set currentMonth to aug
	else if (m is equal to "september") then
		set currentMonth to sep
	else if (m is equal to "october") then
		set currentMonth to oct
	else if (m is equal to "november") then
		set currentMonth to nov
	else if (m is equal to "december") then
		set currentMonth to dec
	end if
	
	-- Function for getting random image
	on getImage(folderName)
		
		tell application "Finder"
			return some file of folder ("Pictures:Wallpapers:" & folderName) of home
		end tell
		
	end getImage
	
	
	tell application "Finder"
		
		
		-- set picture to use for main display
		set mainDisplayPicture to my getImage(currentMonth)
		
		-- set the picture for additional monitors, if applicable
		tell application "System Events"
			
			-- set a reference to all desktops
			set theDesktops to a reference to every desktop
			
			-- manage additional desktops
			if ((count theDesktops) > 1) then
				
				-- loop through all desktops 
				repeat with x from 1 to (count theDesktops)
					
					-- set image to use
					if (useSamePictureAcrossDisplays is false) then
						set secondaryDisplayPicture to my getImage(currentMonth) as text
					else
						set secondaryDisplayPicture to my mainDisplayPicture as text
					end if
					
					-- apply image to desktop
					set picture of item x of the theDesktops to secondaryDisplayPicture as text
					
				end repeat
				
			end if
			
		end tell
		
		-- set the primary monitor's picture
		set desktop picture to mainDisplayPicture as text
		
	end tell
end script

on run
	local tempScript
	copy MyScript to tempScript
	run tempScript
end run
