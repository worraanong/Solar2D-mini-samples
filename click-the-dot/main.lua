-----------------------------------------------------------------------------------------
-- jetaime.dev
-----------------------------------------------------------------------------------------

local x,y = display.contentCenterX, display.contentCenterY
local tapCount = 0
local tapText = display.newText( tapCount, x, 24, "pixel.ttf", 40 )
local dotSize = 24
local dot = display.newCircle( x, y, dotSize)
dot:setFillColor( 1, 0, 0 )
dot.strokeWidth = 2
dot:setStrokeColor( 1, 1, 1 )

switchColor = function (choice)
  case = {
    [1] = function()                              
      dot:setFillColor( 0, 0, 1 )
    end,  
    [2] = function()                              
      dot:setFillColor( 0, 1, 0 )
    end,
    [3] = function()                              
      dot:setFillColor( 0, 1, 1 )
    end,
    [4] = function()                              
      dot:setFillColor( 1, 0, 0 )
    end,
    [5] = function()                              
      dot:setFillColor( 1, 0, 1 )
    end,      
    [6] = function()                              
      dot:setFillColor( 1, 1, 0 )
    end,                                      
    default = function()                          
	    dot:setFillColor(0)
    end,                                           
  }

  if case[choice] then
     case[choice]()
  else
     case["default"]()
  end
end

function dot:tap(event)
  dot.x = math.random(dotSize, display.contentWidth-dotSize)
  dot.y = math.random(80, display.contentHeight-dotSize)
  tapCount = tapCount + 1
  tapText.text = tapCount
  switchColor(math.random(1,6))
end

dot:addEventListener("tap")
