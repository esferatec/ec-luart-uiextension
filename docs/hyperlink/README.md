# HyperLink

Represents a text label control that can display an external link. The onClick event will open the link in the web browser.

![hyperlink](/docs/hyperlink/hyperlink01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover, onLeave and onClick events should not be overridden.

## Constructor

Initializes a new hyper link instance.

```Lua
HyperLink(parent, caption, [x], [y], [width], [height])
```

## Property - LINK

Sets or gets the external link.

```Lua
HyperLink.link (string)
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("HyperLink", "fixed", 320, 250)

local link = uiex.HyperLink(win, "LuaRT")
link.link = "www.luart.org"
link:center()

ui.run(win):wait()
```
