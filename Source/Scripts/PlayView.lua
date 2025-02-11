local pd <const> = playdate
local gfx <const> = pd.graphics

class('PlayView').extends(gfx.sprite)

-- PlayView()
--
function PlayView:init()

	PlayView.super.init(self)
	self:setCenter(0, 0)
	self:setZIndex(100)
	self:setSize(400, 240)
	self:moveTo(0, 0)
	self:draw()
	self:add()
	self.previousAccelerometer = Accelerometer()
	return self

end

-- update()
--
function PlayView:update()

	PlayView.super.update(self)
	local currentAccelerometer = Accelerometer()
	local img = self:getImage()
	gfx.pushContext(img)
		gfx.setColor(gfx.kColorClear)
		gfx.fillRect(10, 60, 380, 40)
		gfx.setColor(gfx.kColorBlack)
		gfx.drawText(self.previousAccelerometer:__tostring() .. "", 10, 60)
	gfx.popContext()
	self:setImage(img)

	self.previousAccelerometer = currentAccelerometer

end

-- remove()
--
function PlayView:remove()

	PlayView.super.remove(self)

end

-- draw()
--
function PlayView:draw()

	local img = self:getImage()
	if not img then
		img = gfx.image.new(self.width, self.height, gfx.kColorClear)
	end
	gfx.pushContext(img)
		gfx.drawTextInRect(gfx.getLocalizedText("in progress", "en"), 10, 10, 380, 220)
	gfx.popContext()
	self:setImage(img)

end
