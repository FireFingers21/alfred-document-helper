#!/bin/zsh --no-rcs

apps=$(mdfind "kMDItemContentTypeTree == 'com.apple.application'")
cat << EOB
{"items": [
	{
		"title": "$([[ $apps =~ "/Pages.app" ]] && echo 'New Pages Document')",
		"uid": "com.apple.iWork.Pages",
		"arg": "com.apple.iWork.Pages",
		"icon": { "path": "images/Pages.png" }
	},
	{
		"title": "$([[ $apps =~ "/Numbers.app" ]] && echo 'New Numbers Spreadsheet')",
		"uid": "com.apple.iWork.Numbers",
		"arg": "com.apple.iWork.Numbers",
        "icon": { "path": "images/Numbers.png" }
	},
	{
		"title": "$([[ $apps =~ "/Keynote.app" ]] && echo 'New Keynote Presentation')",
		"uid": "com.apple.iWork.Keynote",
		"arg": "com.apple.iWork.Keynote",
        "icon": { "path": "images/Keynote.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft Word.app" ]] && echo 'New Word Document')",
		"uid": "com.microsoft.Word",
		"arg": "com.microsoft.Word",
        "icon": { "path": "images/Word.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft Excel.app" ]] && echo 'New Excel Spreadsheet')",
		"uid": "com.microsoft.Excel",
		"arg": "com.microsoft.Excel",
		"icon": { "path": "images/Excel.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft PowerPoint.app" ]] && echo 'New PowerPoint Presentation')",
		"uid": "com.microsoft.Powerpoint",
		"arg": "com.microsoft.Powerpoint",
		"icon": { "path": "images/PowerPoint.png" }
	},
	{
		"title": "$([[ $apps =~ "/Script Editor.app" ]] && echo 'New Script Editor Document')",
		"uid": "com.apple.ScriptEditor2",
		"arg": "com.apple.ScriptEditor2",
		"match": "New AppleScript Script Editor Document",
        "icon": { "path": "images/ScriptEditor.png" }
	},
	{
		"title": "$([[ $apps =~ "/TextEdit.app" ]] && echo 'New TextEdit Document')",
		"uid": "com.apple.TextEdit",
		"arg": "com.apple.TextEdit",
        "icon": { "path": "images/TextEdit.png" }
	},
	{
		"title": "New Google Docs",
		"uid": "docs",
		"arg": "docs",
		"match": "New Google Docs Document",
		"icon": { "path": "images/Docs.png" }
	},
	{
		"title": "New Google Sheets",
		"uid": "sheets",
		"arg": "sheets",
		"match": "New Google Sheets Spreadsheet",
		"icon": { "path": "images/Sheets.png" }
	},
	{
		"title": "New Google Slides",
		"uid": "slides",
		"arg": "slides",
		"match": "New Google Slides Presentation",
		"icon": { "path": "images/Slides.png" }
	}
]}
EOB