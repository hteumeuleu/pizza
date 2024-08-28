import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/crank"
import "Accelerometer"

local pd <const> = playdate
local gfx <const> = pd.graphics
local font <const> = gfx.font.new("Fonts/Roobert-11-Bold")
gfx.setFont(font)

math.randomseed(pd.getSecondsSinceEpoch())
pd.setCrankSoundsDisabled(true)
pd.display.setRefreshRate(30)

local current = Accelerometer()

-- playdate.update()
--
function pd.update()

	pd.timer.updateTimers()
	pd.graphics.sprite.update()
	gfx.clear(gfx.kColorWhite)
	local previous = current
	current:read()
	if previous:equals(current) then
	end
	gfx.drawText(current:__tostring(), 10, 10)

end
