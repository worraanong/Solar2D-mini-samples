-----------------------------------------------------------------------------------------
-- jetaime.dev
-----------------------------------------------------------------------------------------
local widget = require "widget"

local x,y = display.contentCenterX, display.contentCenterY

local hun = 60
local hyg = 40
local hap = 50
local die = false

local lables = display.newText{ text = "Hunger\n\nHygiene\n\nHappiness", x = 48, y = 100, font = "pixel.ttf", fontSize = 24 }
local hunger = display.newText{ text = hun, x = 100, y = 60, font = "pixel.ttf", fontSize = 24 }
local hygiene = display.newText{ text = hyg, x = 100, y = 102, font = "pixel.ttf", fontSize = 24 }
local happiness = display.newText{ text = hap, x = 100, y = 144, font = "pixel.ttf", fontSize = 24 }
local msg = display.newText{ text = "", x = x, y = 200, font = "pixel.ttf", fontSize = 30 }

local check = function(value)
    if (value > 100) then
        return 100
    elseif (value < 0) then
        return 0
    end
    return value
end

local feed = function (event)
    hun = check(hun + 10)
    hunger.text = hun;
end

local bath = function (event)
    hyg = check(hyg + 50)
    hygiene.text = hyg;
end

local play = function (event)
    hap = check(hap + math.random(5,20))
    happiness.text = hap;
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
  onPress = bath,
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
  onPress = play,
}

local deathYet = function ()
    if (hun + hyg + hap == 0) then
      msg.text = "It died!"
      feedBtn:setEnabled(false)
      bathBtn:setEnabled(false)
      playBtn:setEnabled(false)
    end
end

local touch = function (event)
    hun = check(hun + math.random(-25,-5))
    hyg = check(hyg + math.random(-15,0))
    hap = check(hap + math.random(-35,-5))
    hunger.text = hun;
    hygiene.text = hyg;
    happiness.text = hap;
    deathYet();
end

local pet = widget.newButton{
  strokeWidth = 2,
  shape = "circle",
  radius = 20,
  font = "pixel.ttf",
  fontSize = 18,
  labelColor =  { default={0}, over={1} },
  fillColor =   { default={1}, over={0} },
  
  id = "pet",
  label = ">_<",
  left= x-20,
  top = y,
  onPress = touch,
}