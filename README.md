# ec-luart-uiextension

This project provides various extension ui objects for [LuaRT](https://www.luart.org/).
It has been designed to simplify and improve the creation of graphical user interfaces with the LuaRT ui module.

[![Lua 5.4](https://badgen.net/badge/Lua/5.4/yellow)](https://github.com/lua/lua)
[![LuaRT 1.5.1](https://badgen.net/badge/LuaRT/1.5.1/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

## Features

The module provides the following extension objects:

| Name | Description | Module |
| --- | --- | --- |
| LinkLabel | Represents a text label control that can display an internal link. The onClick event can be used to execute any code. | uiextension.lua
| HyperLink | Represents a text label control that can display an external hyperlink. The onClick event will open the link in the web browser. | uiextension.lua
| FileLink | Represents a text label control that can display an internal link. The onClick event will open the file in the file explorer. | uiextension.lua
| DictonaryLink | Represents a text label control that can display an internal link. The onClick event will open the dictonary in the file explorer. | uiextension.lua

More detailed descriptions and usage examples can be found in the docs folder.

*The LinkLabel and HyperLink objects were inspired by the LuaRT example.*

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "uiextension.lua" file into this folder.

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

The extension objects can be loaded using the function *require()*:

```lua
local uiex = require("ecluart.uiextension") 
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
