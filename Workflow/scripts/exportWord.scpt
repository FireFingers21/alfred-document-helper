#!/usr/bin/osascript

on exportFile()
	tell application id "com.microsoft.Word"
		set filePath to path of active document & ":" & name of active document
    	tell application "System Events" to set fileExtension to name extension of disk item filePath
		if (system attribute "exportType1") starts with "PDF" then
			set targetFile to text 1 thru -((count fileExtension) + 2) of filePath & ".pdf"
    	    tell active document to save as file name targetFile file format format PDF
		else if (system attribute "exportType1") starts with "OpenDocument" then
			set targetFile to text 1 thru -((count fileExtension) + 2) of filePath & ".odt"
    	    tell active document to save as file name targetFile file format format ODT
		else if (system attribute "exportType1") starts with "Plain Text" then
			set targetFile to text 1 thru -((count fileExtension) + 2) of filePath & ".txt"
    	    tell active document to save as file name targetFile file format format text
		else if (system attribute "exportType1") starts with "Rich Text" then
			set targetFile to text 1 thru -((count fileExtension) + 2) of filePath & ".rtf"
    	    tell active document to save as file name targetFile file format format rtf
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
	if errStr contains "Can’t get disk item" then
		tell application id "com.microsoft.Word" to display alert alertTitle message "File must first be saved" as critical buttons {"Save As...", "Cancel"} default button "Save As..." cancel button "Cancel"
		try
			tell application id "com.microsoft.Word" to save active document
			exportFile()
		end try
	else if errStr contains "Can’t make {missing value" then
		tell application id "com.microsoft.Word" to display alert alertTitle message "No documents currently open" as critical buttons {"Continue"}
		return
	else
		return
	end if
end try