# LinkRadiobutton

Represents a radiobutton control that can display an internal link. The onClick event can be used to execute any code.

![linkradiobutton](/docs/linkradiobutton/linkradiobutton01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Radiobutton](https://www.luart.org/doc/ui/Radiobutton.html) documentation.

The onHover and onLeave events should not be overridden.

## Constructor

Initializes a new link radiobutton  instance.

```Lua
LinkRadiobutton(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("LinkRadiobutton", "fixed", 320, 250)

local link = uiex.LinkRadiobutton(win, "About", 10, 10)
link:center()
link.fontstyle = { bold = true }

function link:onClick()
  ui.info("About")
end

ui.run(win):wait()
```
