# ec-luart-uiextension

This project provides various extension ui objects for [LuaRT](https://www.luart.org/).
It has been designed to simplify and improve the creation of graphical user interfaces with the LuaRT ui module.

[![LuaRT 2.0.0](https://badgen.net/badge/LuaRT/2.0.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The module provides the following extension objects:

| Name | Description | Module |
| --- | --- | --- |
| AdvancedCheckbox | Represents a checkbox control with a strike-through effect when checked. The onClick event will change the fontstyle property. When the user moves the mouse pointer over the checkbox, an edit control appears. to edit the content. | uiextension.lua
| ColumnPanel | Represents a panel control containing a collection of children widgets. The onClick event saves the current row. | uiextension.lua
| DirectoryEntry | Represents a entry control with a button that allows the user to easily select a directory. | uiextension.lua
| DirectoryLabel | Represents a label control with a button that allows the user to easily select a directory. | uiextension.lua
| DirectoryLink | Represents a label control that can display an external link. The onClick event will open the directory in the file explorer. | uiextension.lua
| FileEntry | Represents a entry control with a button that allows the user to easily select a file. | uiextension.lua
| FileLabel | Represents a label control with a button that allows the user to easily select a file. | uiextension.lua
| FileLink | Represents a label control that can display an external link. The onClick event will open the file in the file explorer. | uiextension.lua
| HyperLink | Represents a label control that can display an external link. The onClick event will open the link in the web browser. | uiextension.lua
| LinkCheckbox | Represents a checkbox control that can display an internal link. The onClick event can be used to execute any code. | uiextension.lua
| LinkLabel | Represents a label control that can display an internal link. The onClick event can be used to execute any code. | uiextension.lua
| LinkRadiobutton | Represents a radiobutton control that can display an internal link. The onClick event can be used to execute any code. | uiextension.lua
| SelectList | Represents a list control containing a collection of selectable items. The onDoubleClick event selects or deselects the item. | uiextension.lua
| StrikeCheckbox | Represents a checkbox control with a strike-through effect when checked. The onClick event will change the fontstyle property. | uiextension.lua
| StrikeEdit | Represents a edit control with a strike-through effect when checked. The onClick event will change the fontstyle property. | uiextension.lua
| StrikeEntry | Represents a entry control with a strike-through effect when checked. The onClick event will change the fontstyle property. | uiextension.lua
| * | * | * |
| DayLabel | Represents a label control that display a day. | uidatetime.lua
| DaynameLabel | Represents a label control that display a dayname. | uidatetime.lua
| DaynumberLabel | Represents a label control that display a daynumber. | uidatetime.lua
| MonthLabel | Represents a label control that display a month. | uidatetime.lua
| MonthnameLabel | Represents a label control that display a monthname. | uidatetime.lua
| MonthnumberLabel | Represents a label control that display a monthnumber. | uidatetime.lua
| WeeknumberLabel | Represents a label control that display a weeknumber. | uidatetime.lua
| YearLabel | Represents a label control that display a year. | uidatetime.lua

More detailed descriptions and usage examples can be found in the docs folder.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "uiextension.lua" file into this folder.
3. Copy the "uidatetime.lua" file into this folder.
4. Copy any icon files into the same folder.

```text
[application]
|
|----ecluart
|   |
|   |----uiextension.lua
|   |----uidatetime.lua
|   |----...
|
|----app.wlua
```

## Usage

The extension module can be loaded using the function *require()*:

```lua
local uiex = require("ecluart.uiextension")
local uidt = require("ecluart.uidatetime")  
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
