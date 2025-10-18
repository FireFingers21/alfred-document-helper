#!/usr/bin/osascript

on exportFile()
	tell application id "com.microsoft.Powerpoint"
		set filePath to path of active presentation & "/" & name of active presentation
    	tell application "System Events" to set fileExtension to name extension of disk item filePath
		if (system attribute "exportType1") starts with "PDF" then
			set targetFile to text 1 thru -((count fileExtension) + 2) of filePath & ".pdf" as text
            tell active presentation to save in (POSIX file targetFile) as save as PDF
		end if
		if (system attribute "revealExport") starts with 1 then tell application "Finder"
			reveal (POSIX file targetFile) as alias
			activate
		end tell
	end tell
	return true
end exportFile

try
	exportFile()
on error errStr number errNum
	set alertTitle to "Unable to Export to " & (system attribute "exportType1")
	if errStr contains "Can’t get disk item" then
		tell application id "com.microsoft.Powerpoint" to display alert alertTitle message "File must first be saved" as critical buttons {"Save As...", "Cancel"} default button "Save As..." cancel button "Cancel"
		try
			tell application id "com.microsoft.Powerpoint" to save active presentation
			exportFile()
		end try
	else if errStr contains "Can’t make {missing value" then
		tell application id "com.microsoft.Powerpoint" to display alert alertTitle message "No documents currently open" as critical buttons {"Continue"}
		return
	else
		return
	end if
end try