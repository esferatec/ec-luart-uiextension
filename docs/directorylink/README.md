# DirectoryLink

 Represents a text label control that can display an external link. The onClick event will open the directory in the file explorer.

![directorylink](/docs/directorylink/directorylink01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover, onLeave and onClick events should not be overridden.

## Constructor

Initializes a new directory link instance.

```Lua
DirectoryLink(parent, caption, [x], [y], [width], [height])
```

## Property - LINK

Sets or gets the external link.

```Lua
DirectoryLink.link (string)
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryLink", "fixed", 320, 250)

local link = uiex.DirectoryLink(win, "LuaRT")
link.link = "C:\\LuaRT"
link:center()

ui.run(win):wait()
```
