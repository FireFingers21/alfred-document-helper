#!/bin/zsh --no-rcs

case $(lsappinfo info -only bundleID `lsappinfo front | sed 's/-/-0x/'`) in
    *com.apple.iWork.Pages*)
        action="exportPages"
        msApp="Word"
        msFile="Document"
        textType1="Plain Text"
        textIcon1="public.plain-text"
        textType2="Rich Text"
        textIcon2="public.rtf"
        ;;
    *com.apple.iWork.Numbers*)
        action="exportNumbers"
        msApp="Excel"
        msFile="Spreadsheet"
        textType1="CSV"
        textIcon1="public.comma-separated-values-text"
        ;;
    *com.apple.iWork.Keynote*)
        action="exportKeynote"
        msApp="PowerPoint"
        msFile="Presentation"
        ;;
esac

if [[ -n ${msApp} ]]; then
cat << EOB
{"items": [
	{
		"title": "Export to PDF",
		"arg": "",
		"variables": { "action": "$action", "exportType1": "PDF", "exportType2": "PDF" },
		"icon": { "type": "filetype", "path": "com.adobe.pdf" }
	},
	{
		"title": "Export to $msApp",
		"variables": { "action": "$action", "exportType1": "$msApp", "exportType2": "$msFile" },
		"icon": { "path": "images/$msApp.png" }
	},
	{
		"title": "$([[ -n ${textType1} ]] && echo Export to $textType1)",
		"variables": { "action": "$action", "exportType1": "$textType1", "exportType2": "$textType1" },
		"icon": { "type": "filetype", "path": "$textIcon1" }
	},
	{
	    "title": "$([[ -n ${textType2} ]] && echo Export to $textType2)",
		"variables": { "action": "$action", "exportType1": "$textType2", "exportType2": "$textType2" },
		"icon": { "type": "filetype", "path": "$textIcon2" }
	}
]}
EOB
fi