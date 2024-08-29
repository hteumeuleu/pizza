import "Scripts/MenuView"
import "Scripts/PlayView"
import "Scripts/EndView"

local pd <const> = playdate
local gfx <const> = pd.graphics
local kStatusMenu <const> = "menu"
local kStatusPlay <const> = "play"
local kStatusEnd <const> = "end"

class("PizzaHunt").extends()

function PizzaHunt:init()

	PizzaHunt.super.init(self)
	self.status = kStatusMenu
	self.view = MenuView()
	self:setInputHandlers()
	return self

end

function PizzaHunt:update()

	if self.status == kStatusPlay then
		if pd.buttonIsPressed(pd.kButtonB) then
			self:changeView(kStatusEnd)
		end
	end

end

function PizzaHunt:setInputHandlers()

	local myInputHandlers = {
		AButtonDown = function()
			if self.status == kStatusMenu then
				self:changeView(kStatusPlay)
			elseif self.status == kStatusEnd then
				self:changeView(kStatusMenu)
			end
		end
	}
	playdate.inputHandlers.push(myInputHandlers)

end

function PizzaHunt:changeView(status)

	if status == kStatusMenu then
		self.status = kStatusMenu
		self.view:remove()
		self.view = MenuView()
	elseif status == kStatusPlay then
		self.status = kStatusPlay
		self.view:remove()
		self.view = PlayView()
	elseif status == kStatusEnd then
		self.status = kStatusEnd
		self.view:remove()
		self.view = EndView()
	end

end
