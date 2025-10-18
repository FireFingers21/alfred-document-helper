#!/usr/bin/osascript

on exportFile()
	tell application id "com.apple.iWork.Keynote"
		set fileName to name of front document as text
		set filePath to POSIX path of (get file of front document)
		tell application "System Events" to set parentFolder to path of (container of disk item filePath)
		if (system attribute "exportType1") starts with "PDF" then
			set targetFile to (parentFolder as string) & fileName & ".pdf"
			export front document to file (targetFile) as PDF with properties {PDF image quality:Best}
		else if (system attribute "exportType1") starts with "PowerPoint" then
			set targetFile to (parentFolder as string) & fileName & ".pptx"
			export front document to file (targetFile) as Microsoft PowerPoint
		end if
		if (system attribute "revealExport") starts with 1 then tell application "Finder"
			reveal file targetFile
			activate
		end tell
	end tell
	return true
end exportFile

try
	exportFile()
on error errStr number errNum
	set alertTitle to "Unable to Export to " & (system attribute "exportType1")
	if errNum is -1728 then
		tell application id "com.apple.iWork.Keynote" to display alert alertTitle message "File must first be saved" as critical buttons {"Save As...", "Cancel"} default button "Save As..." cancel button "Cancel"
		try
			tell application id "com.apple.iWork.Keynote" to save front document
			exportFile()
		end try
	else if errNum is -1719 then
		tell application id "com.apple.iWork.Keynote" to display alert alertTitle message "No presentations currently open" as critical buttons {"Continue"}
		return
	else
		return
	end if
end try