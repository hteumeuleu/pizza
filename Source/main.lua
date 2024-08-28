import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/crank"
import "Scripts/Accelerometer"

local pd <const> = playdate
local gfx <const> = pd.graphics
local roobert <const> = gfx.font.new("Fonts/Roobert-11-Bold")

gfx.setFont(roobert)
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
	-- local previous = current:copy()
	-- current:read()
	-- if not previous:equals(current) then
	-- end
	gfx.drawTextInRect("Welcome to Pizza Hunt! Put on your prettiest Playdate cover and start hunting.\n\nPress A to start.", 10, 10, 380, 220)

end
