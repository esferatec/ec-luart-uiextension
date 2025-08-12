local ui = require("ui")

-- Provides various border ui objects.
local uiborder = {}

local GAP = 2

--#region borderlabel

-- Initializes a new border label instance.
function uiborder.BorderLabel(...)
  local BorderLabel = Object(ui.Label)

  -- Overrides the default label constructor.
  function BorderLabel:constructor(...)
    super(self).constructor(self, ...)

    self.panel = ui.Panel(self.parent)
    self.panel.border = true

    self.panel.x = self.x
    self.x = self.x + GAP
    self.panel.y = self.y
    self.y = self.y + GAP

    self.panel.width = self.width
    self.width = self.width - (2 * GAP)
    self.panel.height = self.height
    self.height = self.height - (2 * GAP)

    self.panel:toback()

    -- Overrides the label x setter.
    function self:set_x(value)
      super(self).set_x(self, value + GAP)
      self.panel.x = value
    end

    -- Overrides the label x getter.
    function self:get_x()
      return self.panel.x
    end

    -- Overrides the label y setter.
    function self:set_y(value)
      super(self).set_y(self, value + GAP)
      self.panel.y = value
    end

    -- Overrides the label y getter.
    function self:get_y()
      return self.panel.y
    end

    -- Overrides the label width setter.
    function self:set_width(value)
      super(self).set_width(self, value - (2 * GAP))
      self.panel.width = value
    end

    -- Overrides the label width getter.
    function self:get_width()
      return self.panel.width
    end

    -- Overrides the label height setter.
    function self:set_height(value)
      super(self).set_height(self, value - (2 * GAP))
      self.panel.height = value
    end

    -- Overrides the label height getter.
    function self:get_height()
      return self.panel.height
    end

    -- Overrides the label align setter.
    function self:set_align(value)
      super(self).set_align(self, value)
      self.panel.align = value

      super(self).set_x(self, self.panel.x + GAP)
      super(self).set_y(self, self.panel.y + GAP)
      super(self).set_width(self, self.panel.width - (2 * GAP))
      super(self).set_height(self, self.panel.height - (2 * GAP))
    end

    -- Overrides the label visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.panel.visible = value
    end

    -- Overrides the label enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.panel.enabled = value
    end

    -- Overrides the label bgcolor setter.
    function self:set_bgcolor(value)
      super(self).set_bgcolor(self, value)
      self.panel.bgcolor = value
    end

    -- Overrides the label parent setter.
    function self:set_parent(value)
      super(self).set_parent(self, value)
      self.panel.parent = value
    end

    -- Overrides the autosize center method.
    function self:autosize()
      super(self).autosize(self)
      self.panel.width = super(self).get_width(self) + (2 * GAP)
      self.panel.height = super(self).get_height(self) + (2 * GAP)
    end

    -- Overrides the label hide method.
    function self:hide()
      self.panel:hide()
      super(self).hide(self)
    end

    -- Overrides the label show method.
    function self:show()
      self.panel:show()
      super(self).show(self)
    end

    -- Overrides the label tofront method.
    function self:tofront()
      self.panel:tofront()
      super(self).tofront(self)
    end

    -- Overrides the label toback method.
    function self:toback()
      self.panel:toback()
      super(self).toback(self)
    end

    -- Overrides the label center method.
    function self:center()
      self.panel:center()
      super(self).center(self)
    end
  end

  return BorderLabel(...)
end

--#endregion

--#region borderpicture

-- Initializes a new border picture instance.
function uiborder.BorderPicture(...)
  local BorderPicture = Object(ui.Picture)

  -- Overrides the default picture constructor.
  function BorderPicture:constructor(...)
    super(self).constructor(self, ...)

    self.panel = ui.Panel(self.parent)
    self.panel.border = true

    self.panel.x = self.x
    self.x = self.x + GAP
    self.panel.y = self.y
    self.y = self.y + GAP

    self.panel.width = self.width
    self.width = self.width - (2 * GAP)
    self.panel.height = self.height
    self.height = self.height - (2 * GAP)

    self.panel:toback()

    -- Overrides the picture x setter.
    function self:set_x(value)
      super(self).set_x(self, value + GAP)
      self.panel.x = value
    end

    -- Overrides the picture x getter.
    function self:get_x()
      return self.panel.x
    end

    -- Overrides the picture y setter.
    function self:set_y(value)
      super(self).set_y(self, value + GAP)
      self.panel.y = value
    end

    -- Overrides the picture y getter.
    function self:get_y()
      return self.panel.y
    end

    -- Overrides the picture width setter.
    function self:set_width(value)
      super(self).set_width(self, value - (2 * GAP))
      self.panel.width = value
    end

    -- Overrides the picture width getter.
    function self:get_width()
      return self.panel.width
    end

    -- Overrides the picture height setter.
    function self:set_height(value)
      super(self).set_height(self, value - (2 * GAP))
      self.panel.height = value
    end

    -- Overrides the picture height getter.
    function self:get_height()
      return self.panel.height
    end

    -- Overrides the picture align setter.
    function self:set_align(value)
      super(self).set_align(self, value)
      self.panel.align = value

      super(self).set_x(self, self.panel.x + GAP)
      super(self).set_y(self, self.panel.y + GAP)
      super(self).set_width(self, self.panel.width - (2 * GAP))
      super(self).set_height(self, self.panel.height - (2 * GAP))
    end

    -- Overrides the picture visible setter.
    function self:set_visible(value)
      super(self).set_visible(self, value)
      self.panel.visible = value
    end

    -- Overrides the picture enabled setter.
    function self:set_enabled(value)
      super(self).set_enabled(self, value)
      self.panel.enabled = value
    end

    -- Overrides the picture parent setter.
    function self:set_parent(value)
      super(self).set_parent(self, value)
      self.panel.parent = value
    end

    -- Overrides the picture bgcolor setter.
    function self:set_bgcolor(value)
      self.panel.bgcolor = value
    end

    -- Overrides the picture hide method.
    function self:hide()
      self.panel:hide()
      super(self).hide(self)
    end

    -- Overrides the picture show method.
    function self:show()
      self.panel:show()
      super(self).show(self)
    end

    -- Overrides the picture tofront method.
    function self:tofront()
      self.panel:tofront()
      super(self).tofront(self)
    end

    -- Overrides the picture toback method.
    function self:toback()
      self.panel:toback()
      super(self).toback(self)
    end

    -- Overrides the picture center method.
    function self:center()
      self.panel:center()
      super(self).center(self)
    end
  end

  return BorderPicture(...)
end

--#endregion

return uiborder
