-----------------------------------------------------------------------------------------
-- jetaime.dev
-----------------------------------------------------------------------------------------
local widget = require "widget"

local x,y = display.contentCenterX, display.contentCenterY

local feed = function (event)
        print("Feed")
    if event.phase == "release" then
        print( "You pressed and released the "..event.target.id.." button!" )
    end
end

local feedBtn = widget.newButton{
  strokeWidth = 2,
  shape = "rect",
  width = 72,
  height = 24,
  font = "pixel.ttf",
  fontSize = 18,
  labelColor =  { default={1}, over={0} },
  fillColor =   { default={0}, over={1} },
  strokeColor = { default={1}, over={1} },
  
  id = "feedBtn",
  label = "Feed",
  left= 20,
  top = 0,
  onPress = feed,
} 

local bathBtn = widget.newButton{
  strokeWidth = 2,
  shape = "rect",
  width = 72,
  height = 24,
  font = "pixel.ttf",
  fontSize = 18,
  labelColor =  { default={1}, over={0} },
  fillColor =   { default={0}, over={1} },
  strokeColor = { default={1}, over={1} },
  
  id = "bathBtn",
  label = "Bath",
  left= 120,
  top = 0,
  onPress = feed,
} 

local playBtn = widget.newButton{
  strokeWidth = 2,
  shape = "rect",
  width = 72,
  height = 24,
  font = "pixel.ttf",
  fontSize = 18,
  labelColor =  { default={1}, over={0} },
  fillColor =   { default={0}, over={1} },
  strokeColor = { default={1}, over={1} },  

  id = "playBtn",
  label = "Play",
  left= 220,
  top = 0,
  onPress = feed,
}

local pet = display.newCircle(x, y, 20, 20 )
local face = display.newText{ text = ">_<", x = x, y = y, font = "pixel.ttf", fontSize = 24, }
face:setFillColor(0)

local die = false

local hunger = display.newText{ text = "Hunger", x = 50, y = 60, font = "pixel.ttf", fontSize = 24, }
local hygiene = display.newText{ text = "Hygiene", x = 50, y = 90, font = "pixel.ttf", fontSize = 24, }
local happiness = display.newText{ text = "Happiness", x = 50, y = 120, font = "pixel.ttf", fontSize = 24, }