# ec-luart-uiextension

This project provides various extension ui objects for [LuaRT](https://www.luart.org/).
It has been designed to simplify and improve the creation of graphical user interfaces with the LuaRT ui module.

![examples](/readme.png)

[![LuaRT 1.8.0](https://badgen.net/badge/LuaRT/1.8.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The module provides the following extension objects:

| Name | Description | Module |
| --- | --- | --- |
| ColumnPanel | Represents a panel control containing a collection of children widgets. The onClick event saves the current row. | uiextension.lua
| DirectoryLink | Represents a label control that can display an external link. The onClick event will open the directory in the file explorer. | uiextension.lua
| FileLink | Represents a label control that can display an external link. The onClick event will open the file in the file explorer. | uiextension.lua
| HyperLink | Represents a label control that can display an external link. The onClick event will open the link in the web browser. | uiextension.lua
| LinkLabel | Represents a label control that can display an internal link. The onClick event can be used to execute any code. | uiextension.lua
| SelectList | Represents a picture control that represents a on or off switch. The onClick or onDoubleClick event will change the status of the switch. | uiextension.lua
| StrikeCheckbox | Represents a checkbox control with a strike-through effect when checked. The onClick event will change the fontstyle property. | uiextension.lua
| StrikeEntry | Represents a entry control with a strike-through effect when checked. The onClick event will change the fontstyle property. | uiextension.lua

More detailed descriptions and usage examples can be found in the docs folder.

*The LinkLabel and HyperLink objects were inspired by the LuaRT example.*

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "uiextension.lua" file into this folder.
3. Copy any icon files into the same folder.

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
