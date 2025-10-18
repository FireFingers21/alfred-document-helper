#!/bin/zsh --no-rcs

case $(lsappinfo info -only bundleID `lsappinfo front | sed 's/-/-0x/'`) in
    *com.apple.iWork.Pages*)
        action="exportPages"
        msApp=("Word" "Document")
        textType1=("Plain Text" "public.plain-text")
        textType2=("Rich Text" "public.rtf")
        ;;
    *com.apple.iWork.Numbers*)
        action="exportNumbers"
        msApp=("Excel" "Spreadsheet")
        textType1=("CSV" "public.comma-separated-values-text")
        ;;
    *com.apple.iWork.Keynote*)
        action="exportKeynote"
        msApp=("PowerPoint" "Presentation")
        msFile="Presentation"
        ;;
    *com.microsoft.Word*)
        action="exportWord"
        odApp=("OpenDocument" "Document" "org.oasis-open.opendocument.text")
        textType1=("Plain Text" "public.plain-text")
        textType2=("Rich Text" "public.rtf")
        ;;
    *com.microsoft.Excel*)
        action="exportExcel"
        textType1=("CSV" "public.comma-separated-values-text")
        ;;
    *com.microsoft.Powerpoint*)
        action="exportPowerPoint"
        ;;
    *)
        export error
        ;;
esac

cat << EOB
{"items": [
	{
		"title": "${action:+Export to PDF}",
		"arg": "",
		"variables": { "action":"${action}", "exportType1":"PDF", "exportType2":"PDF" },
		"icon": { "type":"filetype", "path":"com.adobe.pdf" }
	},
	{
		"title": "${msApp[1]:+Export to ${msApp[1]}}",
		"variables": { "action":"${action}", "exportType1":"${msApp[1]}", "exportType2":"${msApp[2]}" },
		"icon": { "path":"images/${msApp[1]}.png" }
	},
	{
		"title": "${odApp[1]:+Export to ${odApp[1]}}",
		"variables": { "action":"${action}", "exportType1":"${odApp[1]}", "exportType2":"${odApp[2]}" },
		"icon": { "type":"filetype", "path":"${odApp[3]}" }
	},
	{
		"title": "${textType1[1]:+Export to ${textType1[1]}}",
		"variables": { "action":"${action}", "exportType1":"${textType1[1]}", "exportType2":"${textType1[1]}" },
		"icon": { "type":"filetype", "path":"${textType1[2]}" }
	},
	{
		"title": "${textType2[1]:+Export to ${textType2[1]}}",
		"variables": { "action":"${action}", "exportType1":"${textType2[1]}", "exportType2":"${textType2[1]}" },
		"icon": { "type":"filetype", "path":"${textType2[2]}" }
	},
	{
		"title": "${error+No Documents to Export}",
		"subtitle": "${error+Make sure document is the frontmost window on screen}",
		"valid": false
	}
]}
EOB