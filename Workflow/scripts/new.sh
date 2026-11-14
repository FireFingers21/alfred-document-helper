#!/bin/zsh --no-rcs

pages=("/Applications/Pages Creator Studio.app"(N))
numbers=("/Applications/Numbers Creator Studio.app"(N))
keynote=("/Applications/Keynote Creator Studio.app"(N))
word=("/Applications/Microsoft Word.app"(N))
excel=("/Applications/Microsoft Excel.app"(N))
powerpoint=("/Applications/Microsoft PowerPoint.app"(N))
scripteditor=("/System/Applications/Utilities/Script Editor.app"(N))
textedit=("/System/Applications/TextEdit.app"(N))
libreoffice=("/Applications/LibreOffice.app"(N))

[[ "${appearance}" == "dark" || "${appearance}" == "auto" && $(defaults read -g AppleInterfaceStyle) == "Dark" ]] && mode="dark" || mode="light"
cat << EOB
{"items": [
	{
		"title": "${pages:+New Pages Document}",
		"uid": "com.apple.Pages",
		"arg": "com.apple.Pages",
		"match": "iWork Apple Creator Studio Pages Document",
		"icon": { "path": "images/${mode}/Pages.png" }
	},
	{
		"title": "${numbers:+New Numbers Spreadsheet}",
		"uid": "com.apple.Numbers",
		"arg": "com.apple.Numbers",
		"match": "iWork Apple Creator Studio Numbers Spreadsheet",
        "icon": { "path": "images/${mode}/Numbers.png" }
	},
	{
		"title": "${keynote:+New Keynote Presentation}",
		"uid": "com.apple.Keynote",
		"arg": "com.apple.Keynote",
		"match": "iWork Apple Creator Studio Keynote Presentation",
        "icon": { "path": "images/${mode}/Keynote.png" }
	},
	{
		"title": "${word:+New Word Document}",
		"uid": "com.microsoft.Word",
		"arg": "com.microsoft.Word",
		"match": "Microsoft Office 365 Word Document",
        "icon": { "path": "images/${mode}/Word.png" }
	},
	{
		"title": "${excel:+New Excel Spreadsheet}",
		"uid": "com.microsoft.Excel",
		"arg": "com.microsoft.Excel",
		"match": "Microsoft Office 365 Excel Spreadsheet",
		"icon": { "path": "images/${mode}/Excel.png" }
	},
	{
		"title": "${powerpoint:+New PowerPoint Presentation}",
		"uid": "com.microsoft.Powerpoint",
		"arg": "com.microsoft.Powerpoint",
		"match": "Microsoft Office 365 PowerPoint Presentation",
		"icon": { "path": "images/${mode}/PowerPoint.png" }
	},
	{
		"title": "${scripteditor:+New Script Editor Document}",
		"uid": "com.apple.ScriptEditor2",
		"arg": "com.apple.ScriptEditor2",
		"match": "AppleScript Script Editor Document",
        "icon": { "path": "images/${mode}/ScriptEditor.png" }
	},
	{
		"title": "${textedit:+New TextEdit Document}",
		"uid": "com.apple.TextEdit",
		"arg": "com.apple.TextEdit",
		"match": "TextEdit Document",
        "icon": { "path": "images/${mode}/TextEdit.png" }
	},
	{
		"title": "New Google Docs",
		"uid": "docs",
		"arg": "docs",
		"match": "Google Docs Document",
		"icon": { "path": "images/${mode}/Docs.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "New Google Sheets",
		"uid": "sheets",
		"arg": "sheets",
		"match": "Google Sheets Spreadsheet",
		"icon": { "path": "images/${mode}/Sheets.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "New Google Slides",
		"uid": "slides",
		"arg": "slides",
		"match": "Google Slides Presentation",
		"icon": { "path": "images/${mode}/Slides.png" },
		"variables": { "type": "web" }
	},
	{
		"title": "${libreoffice:+New Writer Document}",
		"uid": "writer",
		"arg": "writer",
		"match": "LibreOffice Writer Document",
        "icon": { "path": "images/${mode}/Writer.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "${libreoffice:+New Calc Spreadsheet}",
		"uid": "calc",
		"arg": "calc",
		"match": "LibreOffice Calc Spreadsheet",
        "icon": { "path": "images/${mode}/Calc.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "${libreoffice:+New Impress Presentation}",
		"uid": "impress",
		"arg": "impress",
		"match": "LibreOffice Impress Presentation",
        "icon": { "path": "images/${mode}/Impress.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "${libreoffice:+New Draw Drawing}",
		"uid": "draw",
		"arg": "draw",
		"match": "LibreOffice Draw Drawing",
        "icon": { "path": "images/${mode}/Draw.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "${libreoffice:+New Math Formula}",
		"uid": "math",
		"arg": "math",
		"match": "LibreOffice Math Formula",
        "icon": { "path": "images/${mode}/Math.png" },
        "variables": { "type": "LibreOffice" }
	},
	{
		"title": "${libreoffice:+New Base Database}",
		"uid": "base",
		"arg": "base",
		"match": "LibreOffice Base Database",
        "icon": { "path": "images/${mode}/Base.png" },
        "variables": { "type": "LibreOffice" }
	}
]}
EOB