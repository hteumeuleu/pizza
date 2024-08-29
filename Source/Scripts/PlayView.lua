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
	return self

end

-- update()
--
function PlayView:update()

	PlayView.super.update(self)

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
		gfx.drawTextInRect("Game in progress…\nPress Ⓑ to skip.", 10, 10, 380, 220)
	gfx.popContext()
	self:setImage(img)

end
