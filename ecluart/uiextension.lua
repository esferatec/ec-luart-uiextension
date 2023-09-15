local ui = require("ui")
local sys = require("sys")

-- Provides various ui objects.
local uiextension = {}

--#region linklabel

-- Creates a new link label object.
local LinkLabel = Object(ui.Label)

-- Overrites the default label constructor.
function LinkLabel:constructor(...)
  super(self).constructor(self, ...)
  self.cursor = "hand"
end

-- Overrites the label onhover event.
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

-- Overrites the label onleave event.
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

--#region hyperlink

-- Creates a new hyper link object.
local HyperLink = Object(ui.Label)

-- Overrites the default label constructor.
function HyperLink:constructor(...)
  super(self).constructor(self, ...)
  self.vdcolor = 0x551A8B -- vistied color
  self.hvcolor = 0x0000EE -- hoover color
  self.fgcolor = self.hvcolor
  self.cursor = "hand"
end

-- Overrites the label onhover event.
function HyperLink:onHover()
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

-- Overrites the label onleave event.
function HyperLink:onLeave()
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

-- Overrites the label onclick event.
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
local FileLink = Object(ui.Label)

-- Overrites the default label constructor.
function FileLink:constructor(...)
  super(self).constructor(self, ...)
  self.vdcolor = 0x551A8B -- vistied color
  self.hvcolor = 0x0000EE -- hoover color
  self.fgcolor = self.hvcolor
  self.cursor = "hand"
end

-- Overrites the label onhover event.
function FileLink:onHover()
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

-- Overrites the label onleave event.
function FileLink:onLeave()
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

-- Overrites the label onclick event.
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
local DirectoryLink = Object(ui.Label)

-- Overrites the default label constructor.
function DirectoryLink:constructor(...)
  super(self).constructor(self, ...)
  self.vdcolor = 0x551A8B -- vistied color
  self.hvcolor = 0x0000EE -- hoover color
  self.fgcolor = self.hvcolor
  self.cursor = "hand"
end

-- Overrites the label onhover event.
function DirectoryLink:onHover()
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

-- Overrites the label onleave event.
function DirectoryLink:onLeave()
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

-- Overrites the label onclick event.
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

return uiextension
