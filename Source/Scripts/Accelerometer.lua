local pd <const> = playdate
local gfx <const> = pd.graphics
local function clamp(value, min, max)
    return math.max(math.min(value, max), min)
end

class('Accelerometer').extends()

function Accelerometer:init(x, y, z)

	Accelerometer.super.init(self)
	self.x = x or 0
	self.y = y or 0
	self.z = z or 0
	self:round()
	if not pd.accelerometerIsRunning() then
		pd.startAccelerometer()
	end
	self:read()
	return self

end

-- function Accelerometer:__tostring()

-- 	return "{" .. self.x .. ", " .. self.y .. ", " .. self.z .. "}"

-- end

function Accelerometer:read()

	self.x, self.y, self.z = pd.readAccelerometer()
	self:round()

end

function Accelerometer:copy()

	return Accelerometer(self.x, self.y, self.z)

end

function Accelerometer:round()

	local round = function(n)
		return clamp(math.floor(n * 10 + 0.5) / 10, 0, 1)
	end
	self.x = round(self.x)
	self.y = round(self.y)
	self.z = round(self.z)

end

function Accelerometer:equals(other)

	if not other.x or not other.y or not other.z then
		return false
	end
	return self.x == other.x and self.y == other.y and self.z == other.z

end
