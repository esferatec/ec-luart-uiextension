# ec-luart-uiextension

This project provides various extension ui objects for [LuaRT](https://www.luart.org/).
It has been designed to simplify and improve the creation of graphical user interfaces with the LuaRT ui module.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The module provides the following extension objects:

| Name | Description |
| --- | --- |
| [AdvancedCheckbox](docs/advancedcheckbox/README.md) | Represents a checkbox control with a strike-through effect when checked. The onClick event will change the fontstyle property. When the user moves the mouse pointer over the checkbox, an edit control appears. to edit the content. |  
| [ColumnPanel](docs/columnpanel/README.md) | Represents a panel control containing a collection of children widgets. The onClick event saves the current row. |  
| [DirectoryEntry](docs/directoryentry/README.md) | Represents a entry control with a button that allows the user to easily select a directory. |  
| [DirectoryLabel](docs/directorylabel/README.md) | Represents a label control with a button that allows the user to easily select a directory. |  
| [DirectoryLink](docs/directorylink/README.md) | Represents a label control that can display an external link. The onClick event will open the directory in the file explorer. |  
| [FileEntry](docs/fileentry/README.md) | Represents a entry control with a button that allows the user to easily select a file. |  
| [FileLabel](docs/filelabel/README.md) | Represents a label control with a button that allows the user to easily select a file. |  
| [FileLink](docs/filelink/README.md) | Represents a label control that can display an external link. The onClick event will open the file in the file explorer. |  
| [HyperLink](docs/hyperlink/README.md) | Represents a label control that can display an external link. The onClick event will open the link in the web browser. |  
| [LinkCheckbox](docs/linkcheckbox/README.md) | Represents a checkbox control that can display an internal link. The onClick event can be used to execute any code. |  
| [LinkLabel](docs/linklabel/README.md) | Represents a label control that can display an internal link. The onClick event can be used to execute any code. |  
| [LinkRadiobutton](docs/linkradiobutton/README.md) | Represents a radiobutton control that can display an internal link. The onClick event can be used to execute any code. |  
| [SelectList](docs/selectlist/README.md) | Represents a list control containing a collection of selectable items. The onDoubleClick event selects or deselects the item. |  
| [StrikeCheckbox](docs/strikecheckbox/README.md) | Represents a checkbox control with a strike-through effect when checked. The onClick event will change the fontstyle property. |  
| [StrikeEdit](docs/strikeedit/README.md) | Represents a edit control with a strike-through effect when checked. The onClick event will change the fontstyle property. |  
| [StrikeEntry](docs/strikeentry/README.md) | Represents a entry control with a strike-through effect when checked. The onClick event will change the fontstyle property. |  

More detailed descriptions and usage examples can be found in the docs folder.

## Installation

1. Create a folder called "ecluart" in your application.
1. Copy the "uiextension.lua" file into this folder.
1. Copy any icon files into the same folder.

```text
[application]
|
|----ecluart
|   |
|   |----uiextension.lua
|   |----...
|
|----app.wlua
```

## Usage

The extension module can be loaded using the function *require()*:

```lua
local uiextension = require("ecluart.uiextension")
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
