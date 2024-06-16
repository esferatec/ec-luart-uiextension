local ui = require("ui")
local sys = require("sys")

-- Provides various extension ui objects.
local uiextension = {}

--#region linklabel

-- Initializes a new link label instance.
function uiextension.LinkLabel(...)
  -- Creates a new link label object.
  local LinkLabel = Object(ui.Label)

  -- Overrides the default label constructor.
  function LinkLabel:constructor(...)
    super(self).constructor(self, ...)
    self.cursor = "hand"
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

  return LinkLabel(...)
end

--#endregion

--#region linkcheckbox

-- Initializes a new link checkbox instance.
function uiextension.LinkCheckbox(...)
  -- Creates a new link checkbox object.
  local LinkCheckbox = Object(ui.Checkbox)

  -- Overrides the default checkbox constructor.
  function LinkCheckbox:constructor(...)
    super(self).constructor(self, ...)
  end

  -- Overrides the checkbox onhover event.
  function LinkCheckbox:onHover()
    local currentFontStyle = self.fontstyle
    currentFontStyle.underline = true
    self.fontstyle = currentFontStyle
  end

  -- Overrides the checkbox onleave event.
  function LinkCheckbox:onLeave()
    local currentFontStyle = self.fontstyle
    currentFontStyle.underline = false
    self.fontstyle = currentFontStyle
  end

  return LinkCheckbox(...)
end

--#endregion

--#region linkradiobutton

-- Initializes a new link radiobutton instance.
function uiextension.LinkRadiobutton(...)
  -- Creates a new link radiobutton object.
  local LinkRadiobutton = Object(ui.Radiobutton)

  -- Overrides the default radiobutton constructor.
  function LinkRadiobutton:constructor(...)
    super(self).constructor(self, ...)
  end

  -- Overrides the radiobutton onhover event.
  function LinkRadiobutton:onHover()
    local currentFontStyle = self.fontstyle
    currentFontStyle.underline = true
    self.fontstyle = currentFontStyle
  end

  -- Overrides the radiobutton onleave event.
  function LinkRadiobutton:onLeave()
    local currentFontStyle = self.fontstyle
    currentFontStyle.underline = false
    self.fontstyle = currentFontStyle
  end

  return LinkRadiobutton(...)
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

-- Initializes a new hyper link instance.
function uiextension.HyperLink(...)
  -- Creates a new hyper link object.
  local HyperLink = Object(BaseLink)

  -- Overrides the label onclick event.
  function HyperLink:onClick()
    self.fgcolor = self.vdcolor
    sys.cmd("start " .. self.link, true, true)
  end

  return HyperLink(...)
end

--#endregion

--#region filelink

-- Initializes a new file link instance.
function uiextension.FileLink(...)
  -- Creates a new file link object.
  local FileLink = Object(BaseLink)

  -- Overrides the label onclick event.
  function FileLink:onClick()
    self.fgcolor = self.vdcolor
    local linkedFile = sys.File(self.link)
    sys.cmd("explorer /select," .. linkedFile.fullpath, true, true)
  end

  return FileLink(...)
end

--#endregion

--#region directorylink

-- Initializes a new directory link instance.
function uiextension.DirectoryLink(...)
  -- Creates a new directory link object.
  local DirectoryLink = Object(BaseLink)

  -- Overrides the label onclick event.
  function DirectoryLink:onClick()
    self.fgcolor = self.vdcolor
    local linkedFolder = sys.Directory(self.link)
    sys.cmd("explorer /select," .. linkedFolder.fullpath, true, true)
  end

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

-- Initializes a new strike checkbox instance.
function uiextension.StrikeCheckbox(...)
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

  return StrikeCheckbox(...)
end

--#endregion

--#region strikeentry

-- Initializes a new strike entry instance.
function uiextension.StrikeEntry(...)
  -- Creates a new strike entry object.
  local StrikeEntry = Object(ui.Entry)

  -- Overrides the default entry constructor.
  function StrikeEntry:constructor(parent, caption, x, y, width, height)
    self.checkbox = ui.Checkbox(parent, " ", x, y, 16, height)
    self.checkbox.mother = self

    x = (x and x + self.checkbox.width) or 24
    width = (width and width - self.checkbox.width) or width

    super(self).constructor(self, parent, caption, x, y, width, height)

    -- Creates a entry checked setter.
    function StrikeEntry:set_checked(value)
      self.checkbox.checked = value

      local currentFontStyle = self.fontstyle
      currentFontStyle.strike = self.checkbox.checked
      self.fontstyle = currentFontStyle
    end

    -- Creates a entry checked getter.
    function self:get_checked()
      return self.checkbox.checked
    end

    -- Overrides the entry y setter.
    function StrikeEntry:set_y(value)
      super(self).set_y(self, value)
      self.checkbox.y = value
    end

    -- Overrides the entry x setter.
    function self:set_x(value)
      super(self).set_x(self, value + self.checkbox.width)
      self.checkbox.x = value
    end

    -- Overrides the entry x getter.
    function self:get_x()
      return self.checkbox.x
    end

    -- Overrides the entry width setter.
    function self:set_width(value)
      super(self).set_width(self, value - self.checkbox.width)
      self.checkbox.width = self.checkbox.width
    end

    -- Overrides the entry width getter.
    function self:get_width()
      return super(self).get_width(self) + self.checkbox.width
    end

    -- Overrides the entry height setter.
    function self:set_height(value)
      super(self).set_height(self, value)
      self.checkbox.height = value
    end

    -- Overrides the entry visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.checkbox.visible = value
    end

    -- Overrides the entry enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.checkbox.enabled = value
    end

    -- Overrides the entry hide method.
    function self:hide()
      super(self).hide(self)
      self.checkbox:hide()
    end

    -- Overrides the entry show method.
    function self:show()
      super(self).show(self)
      self.checkbox:show()
    end

    -- Overrides the entry tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.checkbox:tofront()
    end

    -- Overrides the entry toback method.
    function self:toback()
      super(self).toback(self)
      self.checkbox:toback()
    end

    -- Overrides the entry onclick event.
    function self:onClick()
      if self.checkbox.checked then
        self.checkbox:show()
      end
    end

    -- Overrides the checkbox onclick event.
    function self.checkbox:onClick()
      self.mother.checked = self.checked
    end
  end

  return StrikeEntry(...)
end

--#endregion

--#region strikeedit

-- Initializes a new strike entry instance.
function uiextension.StrikeEdit(...)
  -- Creates a new strike edit object.
  local StrikeEdit = Object(ui.Edit)

  -- Overrides the default edit constructor.
  function StrikeEdit:constructor(parent, text, x, y, width, height)
    self.checkbox = ui.Checkbox(parent, "", x, y, 16, 16)
    self.checkbox.mother = self

    x = (x and x + self.checkbox.width) or 24
    width = (width and width - self.checkbox.width) or width
    height = (height and height) or self.checkbox.height

    super(self).constructor(self, parent, text, x, y, width, height)
    self.border = false
    self.rtf = false
    self.wordwrap = true

    -- Creates a edit checked setter.
    function self:set_checked(value)
      self.checkbox.checked = value

      self.caret = 1

      local currentFontStyle = self.fontstyle
      currentFontStyle.strike = self.checkbox.checked
      self.fontstyle = currentFontStyle
    end

    -- Creates a edit checked getter.
    function self:get_checked()
      return self.checkbox.checked
    end

    -- Overrides the edit y setter.
    function self:set_y(value)
      super(self).set_y(self, value)
      self.checkbox.y = value
    end

    -- Overrides the edit x setter.
    function StrikeEdit:set_x(value)
      super(self).set_x(self, value + self.checkbox.width)
      self.checkbox.x = value
    end

    -- Overrides the edit x getter.
    function StrikeEdit:get_x()
      return self.checkbox.x
    end

    -- Overrides the edit width setter.
    function StrikeEdit:set_width(value)
      super(self).set_width(self, value - self.checkbox.width)
      self.checkbox.width = self.checkbox.width
    end

    -- Overrides the edit width getter.
    function StrikeEdit:get_width()
      return super(self).get_width(self) + self.checkbox.width
    end

    -- Overrides the edit height setter.
    function StrikeEdit:set_height(value)
      super(self).set_height(self, value)
      self.checkbox.height = value
    end

    -- Overrides the edit hide method.
    function self:hide()
      super(self).hide(self)
      self.checkbox:hide()
    end

    -- Overrides the edit show method.
    function self:show()
      super(self).show(self)
      self.checkbox:show()
    end

    -- Overrides the edit tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.checkbox:tofront()
    end

    -- Overrides the edit toback method.
    function self:toback()
      super(self).toback(self)
      self.checkbox:toback()
    end

    -- Overrides the edit onclick event.
    function self:onClick()
      if self.checkbox.checked then
        self.checkbox:show()
      end
    end

    -- Overrides the checkbox onclick event.
    function self.checkbox:onClick()
      self.mother.checked = self.checked
    end
  end

  return StrikeEdit(...)
end

--#endregion

--#region advancedcheckbox

-- Initializes a new strike checkbox instance.
function uiextension.AdvancedCheckbox(...)
  -- Creates a new strike checkbox object.
  local AdvancedCheckbox = Object(ui.Checkbox)

  -- Overrides the default checkbox constructor.
  function AdvancedCheckbox:constructor(...)
    super(self).constructor(self, ...)

    self.edit = ui.Edit(self.parent, self.text, self.x, self.y, self.width, self.height)
    self.edit.mother = self
    self.edit.visible = false

    -- Overrides the checkbox checked setter.
    function self:set_checked(value)
      super(self).set_checked(self, value)

      local currentFontStyle = self.fontstyle
      currentFontStyle.strike = self.checked
      self.fontstyle = currentFontStyle
    end

    -- Overrides the checkbox onclick event.
    function self:onClick()
      local currentFontStyle = self.fontstyle
      currentFontStyle.strike = self.checked
      self.fontstyle = currentFontStyle
    end

    -- Overrides the checkbox onleave event.
    function self:onLeave()
      if self.checked then
        self.edit.enabled = false
        self.edit.visible = false
      end
    end

    -- Overrides the checkbox onhover event.
    function self:onHover(x, y)
      if x <= 16 and y <= 16 then
        self.edit.visible = false
        return
      end

      if x >= 16 and not self.edit.visible then
        self.edit.text = self.text
        self.edit.x = self.x + 16
        self.edit.y = self.y + 3
        self.edit.width = self.width
        self.edit.height = self.height * 3
        self.edit.border = false
        self.edit.rtf = false
        self.edit.wordwrap = true
        self.edit.fontstyle = self.fontstyle
        self.edit.caret = 1
        self.edit.enabled = not self.checked
        self.edit.visible = true
        self.edit:tofront()
      end
    end

    -- Overrides the edit onleave event.
    function self.edit:onLeave()
      if self.enabled then
        self.mother.text = self.text
      end
      self.enabled = false
      self.visible = false
    end
  end

  return AdvancedCheckbox(...)
end

--#endregion

--#region fileentry

-- Initializes a new file entry instance.
function uiextension.FileEntry(...)
  local FileEntry = Object(ui.Entry)

  -- Overrides the default entry constructor.
  function FileEntry:constructor(...)
    super(self).constructor(self, ...)

    self.button = ui.Button(self.parent, "...")
    self.button.mother = self

    self.gap = 4
    self.width = self.width - self.button.width - self.gap
    self.button.height = self.height
    self.button.x = self.x + self.width + self.gap
    self.button.y = self.y

    -- Overrides the entry x setter.
    function self:set_x(value)
      super(self).set_x(self, value)
      self.button.x = value + super(self).get_width(self) + self.gap
    end

    -- Overrides the entry y setter.
    function self:set_y(value)
      super(self).set_y(self, value)
      self.button.y = value
    end

    -- Overrides the entry width setter.
    function self:set_width(value)
      super(self).set_width(self, value - self.button.width - self.gap)
      self.button.x = self.x + super(self).get_width(self) + self.gap
    end

    -- Overrides the entry width getter.
    function self:get_width()
      return super(self).get_width(self) + self.gap + self.button.width
    end

    -- Overrides the entry height setter.
    function self:set_height(value)
      super(self).set_height(self, value)
      self.button.height = value
    end

    -- Overrides the entry visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.button.visible = value
    end

    -- Overrides the entry enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.button.enabled = value
    end

    -- Overrides the entry hide method.
    function self:hide()
      super(self).hide(self)
      self.button:hide()
    end

    -- Overrides the entry show method.
    function self:show()
      super(self).show(self)
      self.button:show()
    end

    -- Overrides the entry tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.button:tofront()
    end

    -- Overrides the entry toback method.
    function self:toback()
      super(self).toback(self)
      self.button:toback()
    end

    -- Overrides the button onclick event.
    function self.button:onClick()
      local file = ui.opendialog()

      if file ~= nil then
        self.mother.text = file.fullpath
      end
    end
  end

  return FileEntry(...)
end

--#endregion

--#region filelabel

-- Initializes a new file label instance.
function uiextension.FileLabel(...)
  local FileLabel = Object(ui.Label)

  -- Overrides the default label constructor.
  function FileLabel:constructor(...)
    super(self).constructor(self, ...)

    self.button = ui.Button(self.parent, "...")
    self.button.mother = self

    self.gap = 4
    self.width = self.width - self.button.width - self.gap
    self.button.height = self.height
    self.button.x = self.x + self.width + self.gap
    self.button.y = self.y

    -- Overrides the label x setter.
    function self:set_x(value)
      super(self).set_x(self, value)
      self.button.x = value + super(self).get_width(self) + self.gap
    end

    -- Overrides the label y setter.
    function self:set_y(value)
      super(self).set_y(self, value)
      self.button.y = value
    end

    -- Overrides the label width setter.
    function self:set_width(value)
      super(self).set_width(self, value - self.button.width - self.gap)
      self.button.x = self.x + super(self).get_width(self) + self.gap
    end

    -- Overrides the label width getter.
    function self:get_width()
      return super(self).get_width(self) + self.gap + self.button.width
    end

    -- Overrides the label height setter.
    function self:set_height(value)
      super(self).set_height(self, value)
      self.button.height = value
    end

    -- Overrides the label visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.button.visible = value
    end

    -- Overrides the label enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.button.enabled = value
    end

    -- Overrides the label hide method.
    function self:hide()
      super(self).hide(self)
      self.button:hide()
    end

    -- Overrides the label show method.
    function self:show()
      super(self).show(self)
      self.button:show()
    end

    -- Overrides the label tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.button:tofront()
    end

    -- Overrides the label toback method.
    function self:toback()
      super(self).toback(self)
      self.button:toback()
    end

    -- Overrides the button onclick event.
    function self.button:onClick()
      local file = ui.opendialog()

      if file ~= nil then
        self.mother.text = file.fullpath
      end
    end
  end

  return FileLabel(...)
end

--#endregion

--#region directoryentry

-- Initializes a new directory entry instance.
function uiextension.DirectoryEntry(...)
  local DirectoryEntry = Object(ui.Entry)

  -- Overrides the default entry constructor.
  function DirectoryEntry:constructor(...)
    super(self).constructor(self, ...)

    self.button = ui.Button(self.parent, "...")
    self.button.mother = self

    self.gap = 4
    self.width = self.width - self.button.width - self.gap
    self.button.height = self.height
    self.button.x = self.x + self.width + self.gap
    self.button.y = self.y

    -- Overrides the entry x setter.
    function self:set_x(value)
      super(self).set_x(self, value)
      self.button.x = value + super(self).get_width(self) + self.gap
    end

    -- Overrides the entry y setter.
    function self:set_y(value)
      super(self).set_y(self, value)
      self.button.y = value
    end

    -- Overrides the entry width setter.
    function self:set_width(value)
      super(self).set_width(self, value - self.button.width - self.gap)
      self.button.x = self.x + super(self).get_width(self) + self.gap
    end

    -- Overrides the entry width getter.
    function self:get_width()
      return super(self).get_width(self) + self.gap + self.button.width
    end

    -- Overrides the entry height setter.
    function self:set_height(value)
      super(self).set_height(self, value)
      self.button.height = value
    end

    -- Overrides the entry visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.button.visible = value
    end

    -- Overrides the entry enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.button.enabled = value
    end

    -- Overrides the entry hide method.
    function self:hide()
      super(self).hide(self)
      self.button:hide()
    end

    -- Overrides the entry show method.
    function self:show()
      super(self).show(self)
      self.button:show()
    end

    -- Overrides the entry tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.button:tofront()
    end

    -- Overrides the entry toback method.
    function self:toback()
      super(self).toback(self)
      self.button:toback()
    end

    -- Overrides the button onclick event.
    function self.button:onClick()
      local directory = ui.dirdialog()

      if directory ~= nil then
        self.mother.text = directory.fullpath
      end
    end
  end

  return DirectoryEntry(...)
end

--#endregion

--#region directorylabel

-- Initializes a new directory label instance.
function uiextension.DirectoryLabel(...)
  local DirectoryLabel = Object(ui.Label)

  -- Overrides the default label constructor.
  function DirectoryLabel:constructor(...)
    super(self).constructor(self, ...)

    self.button = ui.Button(self.parent, "...")
    self.button.mother = self

    self.gap = 4
    self.width = self.width - self.button.width - self.gap
    self.button.height = self.height
    self.button.x = self.x + self.width + self.gap
    self.button.y = self.y

    -- Overrides the label x setter.
    function self:set_x(value)
      super(self).set_x(self, value)
      self.button.x = value + super(self).get_width(self) + self.gap
    end

    -- Overrides the label y setter.
    function self:set_y(value)
      super(self).set_y(self, value)
      self.button.y = value
    end

    -- Overrides the label width setter.
    function self:set_width(value)
      super(self).set_width(self, value - self.button.width - self.gap)
      self.button.x = self.x + super(self).get_width(self) + self.gap
    end

    -- Overrides the label width getter.
    function self:get_width()
      return super(self).get_width(self) + self.gap + self.button.width
    end

    -- Overrides the label height setter.
    function self:set_height(value)
      super(self).set_height(self, value)
      self.button.height = value
    end

    -- Overrides the label visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.button.visible = value
    end

    -- Overrides the label enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.button.enabled = value
    end

    -- Overrides the label hide method.
    function self:hide()
      super(self).hide(self)
      self.button:hide()
    end

    -- Overrides the label show method.
    function self:show()
      super(self).show(self)
      self.button:show()
    end

    -- Overrides the label tofront method.
    function self:tofront()
      super(self).tofront(self)
      self.button:tofront()
    end

    -- Overrides the label toback method.
    function self:toback()
      super(self).toback(self)
      self.button:toback()
    end

    -- Overrides the button onclick event.
    function self.button:onClick()
      local directory = ui.dirdialog()

      if directory ~= nil then
        self.mother.text = directory.fullpath
      end
    end
  end

  return DirectoryLabel(...)
end

--#endregion

return uiextension
