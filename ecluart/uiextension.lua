local ui = require("ui")
local sys = require("sys")

-- Provides various extension ui objects.
local uiextension = {}

--#region linklabel

-- Creates a new link label object.
local LinkLabel = Object(ui.Label)

-- Overrides the default label constructor.
function LinkLabel:constructor(...)
  super(self).constructor(self, ...)
  self.cursor = "hand"
  self.textalign = "left"
end

-- Overrides the label onhover event.
function LinkLabel:onHover()
  local currentFontStyle = self.fontstyle
  currentFontStyle.underline = true
  self.fontstyle = currentFontStyle
end

-- Overrides the label onleave event.
function LinkLabel:onLeave()
  local currentFontStyle = self.fontstyle
  currentFontStyle.underline = false
  self.fontstyle = currentFontStyle
end

-- Initializes a new link label instance.
function uiextension.LinkLabel(...)
  return LinkLabel(...)
end

--#endregion

--#region baselink

-- Defines the base link prototype.
local BaseLink = Object(ui.Label)

-- Overrides the default label constructor.
function BaseLink:constructor(...)
  super(self).constructor(self,...)

  self.link = ""
  self.vdcolor = 0x551A8B -- visited color
  self.hvcolor = 0x0000EE -- hoover color
  self.fgcolor = self.hvcolor
  self.cursor = "hand"
  self.textalign = "left"
end

-- Overrides the label onhover event.
function BaseLink:onHover()
  if self.fgcolor ~= self.vdcolor then
    self.fgcolor = self.hvcolor
  end

  local currentFontStyle = self.fontstyle
  currentFontStyle.underline = true
  self.fontstyle = currentFontStyle
end

-- Overrides the label onleave event.
function BaseLink:onLeave()
  if self.fgcolor ~= self.vdcolor then
    self.fgcolor = self.hvcolor
  end

  local currentFontStyle = self.fontstyle
  currentFontStyle.underline = false
  self.fontstyle = currentFontStyle
end

--#endregion

--#region hyperlink

-- Creates a new hyper link object.
local HyperLink = Object(BaseLink)

-- Overrides the label onclick event.
function HyperLink:onClick()
  self.fgcolor = self.vdcolor
  sys.cmd("start " .. self.link, true, true)
end

-- Initializes a new hyper link instance.
function uiextension.HyperLink(...)
  return HyperLink(...)
end

--#endregion

--#region filelink

-- Creates a new file link object.
local FileLink = Object(BaseLink)

-- Overrides the label onclick event.
function FileLink:onClick()
  self.fgcolor = self.vdcolor

  local linkedFile = sys.File(self.link)
  sys.cmd("explorer /select," .. linkedFile.fullpath, true, true)
end

-- Initializes a new file link instance.
function uiextension.FileLink(...)
  return FileLink(...)
end

--#endregion

--#region directorylink

-- Creates a new directory link object.
local DirectoryLink = Object(BaseLink)

-- Overrides the label onclick event.
function DirectoryLink:onClick()
  self.fgcolor = self.vdcolor

  local linkedFolder = sys.Directory(self.link)
  sys.cmd("explorer /select," .. linkedFolder.fullpath, true, true)
end

-- Initializes a new directory link instance.
function uiextension.DirectoryLink(...)
  return DirectoryLink(...)
end

--#endregion

--#region selectlist

-- Creates a new select list object.
local SelectList = Object(ui.List)

-- Overrides the default list constructor.
function SelectList:constructor(...)
  super(self).constructor(self, ...)
  self.style = "icons"
  self.selecteditems = {}
end

-- Overrides the default list ondoubleclick event.
function SelectList:onDoubleClick(item)
  if #self.items == 0 then return end
  if item == nil then return end

  if self.selecteditems[item.index] ~= nil then
    item:loadicon(nil)
    self.selecteditems[item.index] = nil
  else
    item:loadicon(sys.currentdir .. "\\ecluart\\_checked.ico")
    self.selecteditems[item.index] = item.text
  end
end

-- Initializes a new select list instance.
function uiextension.SelectList(...)
  return SelectList(...)
end

--#endregion

--#region toggleswitch

-- Creates a new toggle switch object.
local ToggleSwitch = Object(ui.Picture)

-- Overrides the default list constructor.
function ToggleSwitch:constructor(parent, checked, x, y, width, height)
  super(self).constructor(self, parent, "", x, y, width, height)
  local _checked = false

  -- Defines a getter method for the property checked.
  function self:get_checked()
    return _checked
  end

  -- Defines a setter method for the property state.
  function self:set_checked(value)
    _checked = value or false

    local _width = self.width
    local _height = self.height
    local _imageOn = (_height <= 32) and sys.currentdir .. "\\ecluart\\_on2.png" or
        sys.currentdir .. "\\ecluart\\_on3.png"
    local _imageOff = (_height <= 32) and sys.currentdir .. "\\ecluart\\_off2.png" or
        sys.currentdir .. "\\ecluart\\_off3.png"
    self:load(_checked and _imageOn or _imageOff)
    self.width = _width
    self.height = _height
  end

  self.checked = checked
end

-- Overrides the default image onclick event.
function ToggleSwitch:onClick()
  self.checked = not self.checked
end

-- Overrides the default image ondoubleclick event.
function ToggleSwitch:onDoubleClick()
  self.checked = not self.checked
end

-- Initializes a new toggle switch instance.
function uiextension.ToggleSwitch(parent, checked, x, y, width, height)
  return ToggleSwitch(parent, checked, x, y, width, height)
end

--#endregion

--#region columnpanel

-- Creates a new column panel object.
local ColumnPanel = Object(ui.Panel)

-- Overrides the default panel constructor.
function ColumnPanel:constructor(parent, kind, rows, x, y, width, height)
  super(self).constructor(self, parent, x, y, width, height)

  self.gap = 5
  self.rows = rows or 1
  self.kind = kind or Object(ui.Label)
  self.items = {}

  self.firstrow = 1
  self.lastrow = self.rows
  self.currentrow = 1
end

-- Overrides the panel oncreate event.
function ColumnPanel:onCreate()
  local nexty, nextx = 0, 0

  for i = 1, self.rows do
    self.items[i] = self.kind(self, "", nextx, nexty, self.width, nil)
    self.items[i].onClick = function()
      if type(super(self.items[i]).onClick) == "function" then
        super(self.items[i]).onClick(self.items[i])
      end;
      self.currentrow = i
    end
    nexty = i * (self.items[i].height + self.gap)
  end

  self.height = nexty - self.gap
end

-- Changes a property of all children.
function ColumnPanel:change(key, value)
  if type(key) ~= "string" then return end

  for _, child in pairs(self.items) do
    child[key] = value
  end
end

-- Initializes a new column panel instance.
function uiextension.ColumnPanel(parent, kind, rows, x, y, width, height)
  return ColumnPanel(parent, kind, rows, x, y, width, height)
end

--#endregion

--#region strikecheckbox

-- Creates a new strike checkbox object.
local StrikeCheckbox = Object(ui.Checkbox)

-- Overrides the checkbox checked setter.
function StrikeCheckbox:set_checked(value)
  super(self).set_checked(self, value)

  local currentFontStyle = self.fontstyle
  currentFontStyle.strike = self.checked and true or false
  self.fontstyle = currentFontStyle
end

-- Overrides the checkbox onclick event.
function StrikeCheckbox:onClick()
  local currentFontStyle = self.fontstyle
  currentFontStyle.strike = self.checked and true or false
  self.fontstyle = currentFontStyle
end

-- Initializes a new strike checkbox instance.
function uiextension.StrikeCheckbox(...)
  return StrikeCheckbox(...)
end

--#endregion

return uiextension
