-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
--love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local Waterpiece = {}
Waterpiece.set = "false"
set = "false"




function love.load(dt)
  Width, Height = 1000,1000
  succes = love.window.setMode( Width, Height)
  
  local NumberofWaterpiece = 400
  local n
  for n=1,NumberofWaterpiece do
    --Width, Height = love.graphics.getDimensions( ) 
    local LoadRainPointer = {}
    LoadRainPointer.LeftToRightTimer = 1
    LoadRainPointer.Y = math.random(1,Width)
    LoadRainPointer.X = math.random(1,Height)
    LoadRainPointer.SizeMax = 3
    LoadRainPointer.SizeMin = 2
    LoadRainPointer.MinXSpeed = 1
    LoadRainPointer.MaxXSpeed = 5
    LoadRainPointer.MinYSpeed = 8
    LoadRainPointer.MaxYSpeed = 15
    LoadRainPointer.OldXSpeed = 0
    LoadRainPointer.OldYSpeed = 0
    LoadRainPointer.Number = n
    LoadRainPointer.SpeedMultiplier = 1
    
    LoadRainPointer.Size = 5
    LoadRainPointer.XSpeed = math.random(LoadRainPointer.MinXSpeed,LoadRainPointer.MaxXSpeed)
    LoadRainPointer.XSpeed = LoadRainPointer.XSpeed*LoadRainPointer.SpeedMultiplier
    LoadRainPointer.YSpeed = math.random(LoadRainPointer.MinYSpeed,LoadRainPointer.MaxYSpeed)
    LoadRainPointer.YSpeed = LoadRainPointer.YSpeed*LoadRainPointer.SpeedMultiplier
    table.insert(Waterpiece,LoadRainPointer)
  end
  
end

function love.update(dt)
  if set == "false" then
  for n,UpdateRain in pairs(Waterpiece) do
    UpdateRain.Number = UpdateRain.Number +1
    UpdateRain.OldXSpeed=UpdateRain.XSpeed
    UpdateRain.OldXSpeed=UpdateRain.XSpeed
    UpdateRain.XSpeed=(UpdateRain.XSpeed*(UpdateRain.SpeedMultiplier))
    --print(UpdateRain.Number,UpdateRain.OldSpeed,UpdateRain.XSpeed)
  end
  set = "true"
  end
  
  for n,UpdateRain in pairs(Waterpiece) do
    
    
    math.randomseed(os.time())
    
    
    
    
    if UpdateRain.Y > Height + UpdateRain.Size then
        local randomlocal
        UpdateRain.Y = math.random(-20.0)
        UpdateRain.YSpeed = math.random(UpdateRain.MinYSpeed,UpdateRain.MaxYSpeed)
        UpdateRain.MinYSpeed = ( math.random(UpdateRain.MinYSpeed+2,UpdateRain.MinYSpeed-2))
        UpdateRain.MaxYSpeed =  ( math.random(UpdateRain.MinYSpeed+2,UpdateRain.MinYSpeed-2))
        
    
    end
    if UpdateRain.X > Width + UpdateRain.Size then
      UpdateRain.X = math.random(-20.0)
      UpdateRain.XSpeed = math.random(UpdateRain.MinXSpeed,UpdateRain.MaxXSpeed)
      UpdateRain.MinXSpeed = ( math.random(UpdateRain.MinXSpeed-2,UpdateRain.MinXSpeed+2))
      UpdateRain.MaxXSpeed =  ( math.random(UpdateRain.MinXSpeed-2,UpdateRain.MinXSpeed+2))

    end
    --
  
  UpdateRain.OldYSpeed=UpdateRain.YSpeed
  UpdateRain.Y = UpdateRain.Y + UpdateRain.YSpeed
  print(UpdateRain.Number,UpdateRain.OldYSpeed,UpdateRain.YSpeed)
  
  UpdateRain.OldXSpeed=UpdateRain.XSpeed
  UpdateRain.X = UpdateRain.X + UpdateRain.XSpeed
  print(UpdateRain.Number,UpdateRain.OldXSpeed,UpdateRain.XSpeed)
  
  
  end
end

function love.draw()
  for n,DrawPointerRain in pairs(Waterpiece) do
    
    love.graphics.circle("fill",DrawPointerRain.X,DrawPointerRain.Y,DrawPointerRain.Size)
  end
end

function love.keypressed(key)
  
      --print(key)
      if key == "escape" then
      Waterpiece = {}
      
      end

end