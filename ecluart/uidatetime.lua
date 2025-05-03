-- Provides various datetime ui objects.
local uidatetime = {}

--#region local functions

--Defines a function that returns a formatted part of the date.
local function getFormattedDate(code, date)
	return os.date(code, os.time({ year = date.year, month = date.month, day = date.day }))
end

--#endregion

--#region name labels

-- Initialize a new dayname label instance.
function uidatetime.DaynameLabel(...)
	-- Creates a new dayname label object.
	local DaynameLabel = Object(ui.Label)

	-- Overrides the default label constructor.
	function DaynameLabel:constructor(...)
		local _datetime = sys.Datetime()
		local _abbreviated = false

		super(self).constructor(self, ...)
		self.text = _abbreviated and getFormattedDate("%a", _datetime) or _datetime.dayname

		-- Creates a label datetime setter.
		function self:set_datetime(value)
			assert(type(value) == "table",
				"bad argument #1 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")
			assert(is(value, sys.Datetime),
				"bad argument #2 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")

			_datetime = value
			self.text = _abbreviated and getFormattedDate("%a", _datetime) or _datetime.dayname
		end

		-- Creates a label datetime getter.
		function self:get_datetime()
			return _datetime
		end

		-- Creates a label abbreviated setter.
		function self:set_abbreviated(value)
			assert(type(value) == "boolean",
				"bad argument #1 error while setting property 'DaynameLabel.abbreviated' (boolean expected, got " ..
				type(value) .. ")")

			_abbreviated = value
			self.text = _abbreviated and getFormattedDate("%a", _datetime) or _datetime.dayname
		end

		-- Creates a label abbreviated getter.
		function self:get_abbreviated()
			return _abbreviated
		end
	end

	return DaynameLabel(...)
end

-- Initializes a new monthname label instance.
function uidatetime.MonthnameLabel(...)
	-- Creates a new monthname label object.
	local MonthnameLabel = Object(ui.Label)

	-- Overrides the default label constructor.
	function MonthnameLabel:constructor(...)
		local _datetime = sys.Datetime()
		local _abbreviated = false

		super(self).constructor(self, ...)
		self.text = _abbreviated and getFormattedDate("%b", _datetime) or _datetime.monthname

		-- Creates a label datetime setter.
		function self:set_datetime(value)
			assert(type(value) == "table",
				"bad argument #1 error while setting property 'MonthnameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")
			assert(is(value, sys.Datetime),
				"bad argument #2 error while setting property 'MonthnameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")

			_datetime = value
			self.text = _abbreviated and getFormattedDate("%b", _datetime) or _datetime.monthname
		end

		-- Creates a label datetime getter.
		function self:get_datetime()
			return _datetime
		end

		-- Creates a label abbreviated setter.
		function self:set_abbreviated(value)
			assert(type(value) == "boolean",
				"bad argument #1 error while setting property 'DaynameLabel.abbreviated' (boolean expected, got " ..
				type(value) .. ")")

			_abbreviated = value
			self.text = _abbreviated and getFormattedDate("%b", _datetime) or _datetime.monthname
		end

		-- Creates a label abbreviated getter.
		function self:get_abbreviated()
			return _abbreviated
		end
	end

	return MonthnameLabel(...)
end

--#endregion

--#region number labels

-- Initializes a new weeknumber label instance.
function uidatetime.WeeknumberLabel(...)
	-- Creates a new daweeknumber label object.
	local WeeknumberLabel = Object(ui.Label)

	-- Overrides the default label constructor.
	function WeeknumberLabel:constructor(...)
		local _datetime = sys.Datetime()
		local _text = ""

		super(self).constructor(self, ...)
		_text = self.text
		self.text = _text .. (getFormattedDate("%W", _datetime) + 1)

		-- Creates a label datetime setter.
		function self:set_datetime(value)
			assert(type(value) == "table",
				"bad argument #1 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")
			assert(is(value, sys.Datetime),
				"bad argument #2 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")

			_datetime = value
			self.text = _text .. (getFormattedDate("%W", _datetime) + 1)
		end

		-- Creates a label datetime getter.
		function self:get_datetime()
			return _datetime
		end
	end

	return WeeknumberLabel(...)
end

-- Initializes a new daynumber label instance.
function uidatetime.DaynumberLabel(...)
	-- Creates a new daynumber label object.
	local DaynumberLabel = Object(ui.Label)

	-- Overrides the default label constructor.
	function DaynumberLabel:constructor(...)
		local _datetime = sys.Datetime()
		local _text = ""

		super(self).constructor(self, ...)
		_text = self.text
		self.text = _text .. getFormattedDate("%j", _datetime)

		-- Creates a label datetime setter.
		function self:set_datetime(value)
			assert(type(value) == "table",
				"bad argument #1 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")
			assert(is(value, sys.Datetime),
				"bad argument #2 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")

			_datetime = value
			self.text = _text .. getFormattedDate("%j", _datetime)
		end

		-- Creates a label datetime getter.
		function self:get_datetime()
			return _datetime
		end
	end

	return DaynumberLabel(...)
end

-- Initializes a new monthnumber label instance.
function uidatetime.MonthnumberLabel(...)
	-- Creates a new daynumber label object.
	local MonthnumberLabel = Object(ui.Label)

	-- Overrides the default label constructor.
	function MonthnumberLabel:constructor(...)
		local _datetime = sys.Datetime()
		local _text = ""

		super(self).constructor(self, ...)
		_text = self.text
		self.text = _text .. getFormattedDate("%m", _datetime)

		-- Creates a label datetime setter.
		function self:set_datetime(value)
			assert(type(value) == "table",
				"bad argument #1 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")
			assert(is(value, sys.Datetime),
				"bad argument #2 error while setting property 'DaynameLabel.datetime' (datetime expected, got " ..
				type(value) .. ")")

			_datetime = value
			self.text = _text .. getFormattedDate("%m", _datetime)
		end

		-- Creates a label datetime getter.
		function self:get_datetime()
			return _datetime
		end
	end

	return MonthnumberLabel(...)
end

--#endregion

return uidatetime
