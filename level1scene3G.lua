 --Tell your parents
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local sfx = require( "sfx" )
local widget = require("widget")
local score = require("score")

local energy = {}
local numberOfEnergy = 3

local function buttonOnRelease(event)
	local button = event.target.id
		if button == "back" then
			storyboard.gotoScene( "mapG", "fade", 200 )
		elseif button == "nextB" then
			storyboard.gotoScene( "level1question3G", "fade", 200 )
		end
end

function scene:createScene( event )
	local group = self.view

	local background = display.newImage("images/bg.png");
	background.height = _H; background.width = _W + _W/4;
	background.x = _W/2; background.y = _H/2;
	
	local back = widget.newButton
	{
		defaultFile = "images/back2.png",			
		overFile ="images/back2.png",
		id = "back",
		x = _W/30,
		y = _H - _H/10,
		height =  _H/9 + 17,
		width = _W/9 + 18 ,
		onRelease = buttonOnRelease
	}	
	

	local nextB = widget.newButton
	{
		defaultFile = "images/next2.png",			
		overFile ="images/next2.png",
		id = "nextB",
		x = _W - 30,
		y = _H - _H/10,
		height =  _H/9 + 17,
		width = _W/9 + 18 ,
		onRelease = buttonOnRelease
	}	
	
	
	local candy = display.newImage("images/candy.png")
	candy.x = _W - 20; candy.y = _H/15
	candy.width = 80; candy.height = 25

	
	local scoreText = display.newText(score.get(), 270, 10, "Helvetica", 18 )
	scoreText.x = _W - 5; scoreText.y = _H/15
	scoreText:setFillColor( 1,0,0 )
	
	local scenario = display.newImage("images/level1/scene23.jpg")
	scenario.height = _H; scenario.width = _W + _W/4;
	scenario.x = _W/2; scenario.y = _H/2;
	
	timer.performWithDelay(4000,function(e)
			storyboard.gotoScene("level1question3G","fade",200)
		end,1)	




--animation:addEventListener( "sprite", spriteListener )
group:insert(background)
group:insert(scenario)
group:insert( nextB )
group:insert( back )
group:insert( candy )
group:insert( scoreText )
for i=1,numberOfEnergy do
	energy[i] = display.newImage("images/energy.png")
			energy[i].x = _W/90 + (30*i) -_W/9; energy[i].y = _H/15
			energy[i].width = 26; energy[i].height = 25
			group:insert(energy[i])
	end

		
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
local group = self.view

end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "destroyScene", scene )


return scene