import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/crank"
import "Scripts/PizzaHunt"

local pd <const> = playdate
local gfx <const> = pd.graphics
local roobert <const> = gfx.font.new("Fonts/Roobert-11-Bold")

gfx.setFont(roobert)
math.randomseed(pd.getSecondsSinceEpoch())
pd.setCrankSoundsDisabled(true)
pd.display.setRefreshRate(30)

local ph <const> = PizzaHunt()

-- playdate.update()
--
function pd.update()

	pd.timer.updateTimers()
	pd.graphics.sprite.update()
	ph:update()

end
