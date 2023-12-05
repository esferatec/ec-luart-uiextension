# ToggleSwitch

Represents a picture control that represents a on or off switch. The onClick or onDoubleClick event will change the status of the switch.

![ToggleSwitch](/docs/toggleswitch/toggleswitch01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT List](https://www.luart.org/doc/ui/Picture.html) documentation.

The onClick or onDoubleClick event should not be overridden.

## Constructor

Initializes a new toggle switch instance.

```Lua
ToggleSwitch(parent, [checked], [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
checked | boolean | Sets the on (true) or off (false) state. The default is off (false).

## Property - CHECKED

Gets or sets the on (true) or off (false) state.

```Lua
ToggleSwitch.checked (boolean)
```

## Example

```Lua
local ui = require("ui")
local sys = require("sys")
local uiex = require("ecluart.uiextension")

local win = ui.Window("ToggleSwitch", "fixed", 320, 250)
win:status()

local switch = uiex.ToggleSwitch(win, false, 10, 10, 32, 32)
win:status(switch.checked)
switch:center()

local button = ui.Button(win, "On/Off", 10, 10, 100, 40)

function button:onClick()
   switch.checked = not switch.checked
   win:status(switch.checked)
end

ui.run(win):wait()
```

![ToggleSwitch](/docs/toggleswitch/toggleswitch01.png)
