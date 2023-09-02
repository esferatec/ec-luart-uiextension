# HyperLink

Represents a text label control that can display an external hyperlink. The onClick event will open the link in the default web browser.

![hyperlink](/docs/hyperlink/hyperlink01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover, onLeave and onClick events should not be overridden.

## Constructor

Initializes a new hyper link instance.

```Lua
HyperLink(parent, link, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
link | string | Sets the external link.

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("Hyperlink", "fixed", 320, 250)

local link = uiex.HyperLink(win, "www.luart.org")
link:center()

win:show()

while win.visible do
  ui.update()
end
```

![hyperlink](/docs/hyperlink/hyperlink01.png)
