#!/usr/bin/osascript

on exportToPDF()
	tell application id "com.apple.iWork.Numbers"
		set fileName to name of front document as text
		set filePath to POSIX path of (get file of front document)
		tell application "System Events" to set parentFolder to path of (container of disk item filePath)
		if (system attribute "exportType1") starts with "PDF" then
			set targetFile to (parentFolder as string) & fileName & ".pdf"
			export front document to file (targetFile) as PDF with properties {image quality:Best}
		else if (system attribute "exportType1") starts with "Excel" then
			set targetFile to (parentFolder as string) & fileName & ".xlsx"
			export front document to file (targetFile) as Microsoft Excel
		else if (system attribute "exportType1") starts with "CSV" then
			set targetFile to (parentFolder as string) & fileName & ".csv"
			export front document to file (targetFile) as CSV
		end if
		if (system attribute "revealExport") starts with 1 then tell application "Finder"
			reveal file targetFile
			activate
		end tell
	end tell
	return true
end exportToPDF

try
	exportToPDF()
on error errStr number errNum
	set alertTitle to "Unable to Export to " & (system attribute "exportType1")
	if errNum is -1728 then
		tell application id "com.apple.iWork.Numbers" to display alert alertTitle message "File must first be saved" as critical buttons {"Save As...", "Cancel"} default button "Save As..." cancel button "Cancel"
		try
			tell application id "com.apple.iWork.Numbers" to save front document
			exportToPDF()
		end try
	else if errNum is -1719 then
		tell application id "com.apple.iWork.Numbers" to display alert alertTitle message "No spreadsheets currently open" as critical buttons {"Continue"}
		return
	else
		return
	end if
end try