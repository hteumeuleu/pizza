local pd <const> = playdate
local gfx <const> = pd.graphics

class('EndView').extends(gfx.sprite)

-- EndView()
--
function EndView:init()

	EndView.super.init(self)
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
function EndView:update()

	EndView.super.update(self)

end

-- remove()
--
function EndView:remove()

	EndView.super.remove(self)

end

-- draw()
--
function EndView:draw()

	local img = self:getImage()
	if not img then
		img = gfx.image.new(self.width, self.height, gfx.kColorClear)
	end
	gfx.pushContext(img)
		gfx.drawTextInRect("Congratulations!\nPress Ⓐ to restart.", 10, 10, 380, 220)
	gfx.popContext()
	self:setImage(img)

end
