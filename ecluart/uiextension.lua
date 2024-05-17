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
  super(self).constructor(self, ...)

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

--#region columnpanel

-- Creates a new column panel object.
local ColumnPanel = Object(ui.Panel)

-- Overrides the default panel constructor.
function ColumnPanel:constructor(parent, kind, rows, gap, x, y, width, height)
  super(self).constructor(self, parent, x, y, width, height)

  self.gap = gap or 5
  self.rows = rows or 1
  self.kind = kind or ui.Label
  self.items = {}

  self.firstrow = 1
  self.lastrow = self.rows
  self.currentrow = 1
end

-- Overrides the panel enabled setter.
function ColumnPanel:set_enabled(value)
  super(self).set_enabled(self, value)

  for _, item in ipairs(self.items) do
    if type(item.enabled) ~= "nil" then
      item.enabled = value
    end
  end
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
function uiextension.ColumnPanel(parent, kind, rows, gap, x, y, width, height)
  return ColumnPanel(parent, kind, rows, gap, x, y, width, height)
end

--#endregion

--#region strikecheckbox

-- Creates a new strike checkbox object.
local StrikeCheckbox = Object(ui.Checkbox)

-- Overrides the checkbox checked setter.
function StrikeCheckbox:set_checked(value)
  super(self).set_checked(self, value)

  local currentFontStyle = self.fontstyle
  currentFontStyle.strike = self.checked
  self.fontstyle = currentFontStyle
end

-- Overrides the checkbox onclick event.
function StrikeCheckbox:onClick()
  local currentFontStyle = self.fontstyle
  currentFontStyle.strike = self.checked
  self.fontstyle = currentFontStyle
end

-- Initializes a new strike checkbox instance.
function uiextension.StrikeCheckbox(...)
  return StrikeCheckbox(...)
end

--#endregion

--#region strikeentry

-- Creates a new strike entry object.
local StrikeEntry = Object(ui.Entry)

function StrikeEntry:constructor(parent, caption, x, y, width, height)
  self._x = x
  self._y = y
  self._width = width
  self._height = height

  self.checkbox = ui.Checkbox(parent, " ", x, y, 16, height)
  self.checkbox.mother = self

  x = x and x + 16 or 24
  width = width and width - 16 or width
  super(self).constructor(self, parent, caption, x, y, width, height)

  -- Overrides the checkbox onclick event.
  function self.checkbox:onClick()
    self.mother.checked = self.checked
  end
end

function StrikeEntry:get_checked()
  return self.checkbox.checked
end

-- Overrides the entry checked setter.
function StrikeEntry:set_checked(value)
  self.checkbox.checked = value

  local currentFontStyle = self.fontstyle
  currentFontStyle.strike = self.checkbox.checked
  self.fontstyle = currentFontStyle

  self.enabled = not self.checkbox.checked
end

-- Overrides the entry y setter.
function StrikeEntry:set_y(value)
  self._y = value
  self.checkbox.y = value
  super(self).set_y(self, value)
end

-- Overrides the entry y getter.
function StrikeEntry:get_y()
  return self._y
end

-- Overrides the entry x setter.
function StrikeEntry:set_x(value)
  self._x = value
  self.checkbox.x = value
  super(self).set_x(self, value and value + 16 or value)
end

-- Overrides the entry x getter.
function StrikeEntry:get_x()
  return self._x
end

-- Overrides the entry width setter.
function StrikeEntry:set_width(value)
  self._width = value
  self.checkbox.width = 16
  super(self).set_width(self, value and value - 16 or value)
end

-- Overrides the entry width getter.
function StrikeEntry:get_width()
  return self._width
end

-- Overrides the entry height setter.
function StrikeEntry:set_height(value)
  self._height = value
  self.checkbox.height = value
  super(self).set_height(self, value)
end

-- Overrides the entry height getter.
function StrikeEntry:get_heiht()
  return self._height
end

-- Initializes a new strike entry instance.
function uiextension.StrikeEntry(...)
  return StrikeEntry(...)
end

--#endregion

return uiextension
