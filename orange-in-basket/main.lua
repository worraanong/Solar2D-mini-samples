-----------------------------------------------------------------------------------------
-- jetaime.dev
-----------------------------------------------------------------------------------------
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 10 )
physics.getGravity()
local x,y = display.contentCenterX, display.contentCenterY

local basket = display.newRect( x, 280, 100, 30)
physics.addBody( basket, "static", { isSensor=true })

local score = 0
local scoreText = display.newText( score, 20, 24, "pixel.ttf", 40 )

local function dropOrange()
	local pos = math.random(10,600)
	local orange = display.newCircle( pos, 0, 12)
	orange.myName = "orange"
	physics.addBody( orange, "dynamic")
	orange:setFillColor( 1,0.5,0 )
end	

local function moveBasket( event )
	local basket = event.target
	local phase = event.phase

	if ( "began" == phase ) then
		display.currentStage:setFocus( basket )
		basket.touchOffsetX = event.x - basket.x

	elseif ( "moved" == phase ) then
		basket.x = event.x - basket.touchOffsetX

	elseif ( "ended" == phase or "cancelled" == phase ) then
		display.currentStage:setFocus( nil )
	end

	return true
end

basket:addEventListener( "touch", moveBasket )


local function gameLoop()
	dropOrange()
	local gx, gy = physics.getGravity()
	physics.setGravity( 0, gy+1 )
end

gameLoopTimer = timer.performWithDelay( 1000, gameLoop, 0 )


local function onCollision( event )
	if ( event.phase == "began" ) then
		local obj1 = event.object2
		print("Collide")
		score = score + 1
		scoreText.text = score
		display.remove( obj1 )
	end
end

Runtime:addEventListener( "collision", onCollision )