local pd <const> = playdate
local gfx <const> = pd.graphics

class('MenuView').extends(gfx.sprite)

-- MenuView()
--
function MenuView:init()

	MenuView.super.init(self)
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
function MenuView:update()

	MenuView.super.update(self)

end

-- remove()
--
function MenuView:remove()

	MenuView.super.remove(self)

end

-- draw()
--
function MenuView:draw()

	local img = self:getImage()
	if not img then
		img = gfx.image.new(self.width, self.height, gfx.kColorClear)
	end
	gfx.pushContext(img)
		gfx.drawTextInRect("Welcome to Pizza Hunt! Put on your prettiest Playdate cover and start hunting.\n\nPress Ⓐ to start.", 10, 10, 380, 220)
	gfx.popContext()
	self:setImage(img)

end
