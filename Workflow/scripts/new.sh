#!/bin/zsh --no-rcs

apps=$(mdfind "kMDItemContentTypeTree == 'com.apple.application'")
cat << EOB
{"items": [
	{
		"title": "$([[ $apps =~ "/Pages.app" ]] && echo 'New Pages Document')",
		"uid": "com.apple.iWork.Pages",
		"arg": "com.apple.iWork.Pages",
		"match": "iWork Pages Document",
		"icon": { "path": "images/Pages.png" }
	},
	{
		"title": "$([[ $apps =~ "/Numbers.app" ]] && echo 'New Numbers Spreadsheet')",
		"uid": "com.apple.iWork.Numbers",
		"arg": "com.apple.iWork.Numbers",
		"match": "iWork Numbers Spreadsheet",
        "icon": { "path": "images/Numbers.png" }
	},
	{
		"title": "$([[ $apps =~ "/Keynote.app" ]] && echo 'New Keynote Presentation')",
		"uid": "com.apple.iWork.Keynote",
		"arg": "com.apple.iWork.Keynote",
		"match": "iWork Keynote Presentation",
        "icon": { "path": "images/Keynote.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft Word.app" ]] && echo 'New Word Document')",
		"uid": "com.microsoft.Word",
		"arg": "com.microsoft.Word",
		"match": "Microsoft Office 365 Word Document",
        "icon": { "path": "images/Word.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft Excel.app" ]] && echo 'New Excel Spreadsheet')",
		"uid": "com.microsoft.Excel",
		"arg": "com.microsoft.Excel",
		"match": "Microsoft Office 365 Excel Spreadsheet",
		"icon": { "path": "images/Excel.png" }
	},
	{
		"title": "$([[ $apps =~ "/Microsoft PowerPoint.app" ]] && echo 'New PowerPoint Presentation')",
		"uid": "com.microsoft.Powerpoint",
		"arg": "com.microsoft.Powerpoint",
		"match": "Microsoft Office 365 PowerPoint Presentation",
		"icon": { "path": "images/PowerPoint.png" }
	},
	{
		"title": "$([[ $apps =~ "/Script Editor.app" ]] && echo 'New Script Editor Document')",
		"uid": "com.apple.ScriptEditor2",
		"arg": "com.apple.ScriptEditor2",
		"match": "AppleScript Script Editor Document",
        "icon": { "path": "images/ScriptEditor.png" }
	},
	{
		"title": "$([[ $apps =~ "/TextEdit.app" ]] && echo 'New TextEdit Document')",
		"uid": "com.apple.TextEdit",
		"arg": "com.apple.TextEdit",
		"match": "TextEdit Document",
        "icon": { "path": "images/TextEdit.png" }
	},
	{
		"title": "New Google Docs",
		"uid": "docs",
		"arg": "docs",
		"match": "Google Docs Document",
		"icon": { "path": "images/Docs.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "New Google Sheets",
		"uid": "sheets",
		"arg": "sheets",
		"match": "Google Sheets Spreadsheet",
		"icon": { "path": "images/Sheets.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "New Google Slides",
		"uid": "slides",
		"arg": "slides",
		"match": "Google Slides Presentation",
		"icon": { "path": "images/Slides.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Writer Document')",
		"uid": "writer",
		"arg": "writer",
		"match": "LibreOffice Writer Document",
        "icon": { "path": "images/Writer.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Calc Spreadsheet')",
		"uid": "calc",
		"arg": "calc",
		"match": "LibreOffice Calc Spreadsheet",
        "icon": { "path": "images/Calc.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Impress Presentation')",
		"uid": "impress",
		"arg": "impress",
		"match": "LibreOffice Impress Presentation",
        "icon": { "path": "images/Impress.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Draw Drawing')",
		"uid": "draw",
		"arg": "draw",
		"match": "LibreOffice Draw Drawing",
        "icon": { "path": "images/Draw.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Math Formula')",
		"uid": "math",
		"arg": "math",
		"match": "LibreOffice Math Formula",
        "icon": { "path": "images/Math.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "$([[ $apps =~ "/LibreOffice.app" ]] && echo 'New Base Database')",
		"uid": "base",
		"arg": "base",
		"match": "LibreOffice Base Database",
        "icon": { "path": "images/Base.png" },
        "variables": { "type": "LibreOffice" }
	}
]}
EOB