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
  local currentItalic = self.fontstyle.italic
  local currentStrike = self.fontstyle.strike
  local currentThin = self.fontstyle.thin
  local currentBold = self.fontstyle.bold

  self.fontstyle = {
    underline = true,
    italic = currentItalic,
    strike = currentStrike,
    thin = currentThin,
    bold = currentBold
  }
end

-- Overrides the label onleave event.
function LinkLabel:onLeave()
  local currentItalic = self.fontstyle.italic
  local currentStrike = self.fontstyle.strike
  local currentThin = self.fontstyle.thin
  local currentBold = self.fontstyle.bold

  self.fontstyle = {
    underline = false,
    italic = currentItalic,
    strike = currentStrike,
    thin = currentThin,
    bold = currentBold
  }
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

  self.vdcolor = 0x551A8B -- vistied color
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

  local currentItalic = self.fontstyle.italic
  local currentStrike = self.fontstyle.strike
  local currentThin = self.fontstyle.thin
  local currentBold = self.fontstyle.bold

  self.fontstyle = {
    underline = true,
    italic = currentItalic,
    strike = currentStrike,
    thin = currentThin,
    bold = currentBold
  }
end

-- Overrides the label onleave event.
function BaseLink:onLeave()
  if self.fgcolor ~= self.vdcolor then
    self.fgcolor = self.hvcolor
  end

  local currentItalic = self.fontstyle.italic
  local currentStrike = self.fontstyle.strike
  local currentThin = self.fontstyle.thin
  local currentBold = self.fontstyle.bold

  self.fontstyle = {
    underline = false,
    italic = currentItalic,
    strike = currentStrike,
    thin = currentThin,
    bold = currentBold
  }
end

--#endregion

--#region hyperlink

-- Creates a new hyper link object.
local HyperLink = Object(BaseLink)

-- Overrides the label onclick event.
function HyperLink:onClick()
  self.fgcolor = self.vdcolor
  sys.cmd("start " .. self.text)
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

  local linkedFile = sys.File(self.text)
  sys.cmd("explorer /select," .. linkedFile.fullpath)
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

  local linkedFolder = sys.Directory(self.text)
  sys.cmd("explorer /select," .. linkedFolder.fullpath)
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

  -- Defines a table for all selected items.
  local _selectedItems = {}

  -- Defines a getter method for the property selectedItems.
  function SelectList:get_selecteditems()
    return _selectedItems
  end

  -- Defines a setter method for the property selectedItems.
  function SelectList:set_selecteditems()
    return
  end

  -- Overrides the default list ondoubleclick event.
  function SelectList:onDoubleClick(item)
    if #self.items == 0 then return end
    if item == nil then return end

    if _selectedItems[item.index] ~= nil then
      item:loadicon(sys.currentdir .. "\\ecluart\\_unchecked.ico")
      _selectedItems[item.index] = nil
    else
      item:loadicon(sys.currentdir .. "\\ecluart\\_checked.ico")
      _selectedItems[item.index] = item.text
    end
  end
end

-- Initializes a new checkbox list instance.
function uiextension.SelectList(...)
  return SelectList(...)
end

--#endregion

return uiextension
