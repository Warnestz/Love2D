-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
--io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
--love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
--if arg[#arg] == "-debug" then require("mobdebug").start() end
-- fin initialisation de base avant prohramme
--function setvariableforgameship()
-- variable debut
game = {}
game.largeur = 0
game.hauteur = 0

player = {}
player.number =0

player1 = {}
player1.controlvaisseau = 0
player1.number = 1

player2 = {}
player2.controlvaisseau = 0
player2.number = 2

colision = {}
colision.rond = 1
colision.rebond = 0



-- v1
vaisseau1 = {}
vaisseau1.x    = 0
vaisseau1.y    = 0
vaisseau1.angle = -90
vaisseau1.vx   = 0
vaisseau1.vy   = 0
vaisseau1.accelerer    = 0
vaisseau1.canmove = 0
vaisseau1.showship = 0
vaisseau1.showengine = 0

vaisseau1.imgship      = love.graphics.newImage("image/ship.png")
vaisseau1.imgengine    = love.graphics.newImage("image/engine.png")
-- v1




-- variable fin
--end
--
function setscreen ()
largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
end
--

-- setgamevaisseau debut
function setgameship1()
  player1.controlvaisseau = 1              -- selectionne l'entiter que le joueur controle
  vaisseau1.showship = 1           -- afficher le vaisseau 
  vaisseau1.showengine = 0         -- afficher le feu de la propullsion
  vaisseau1.x    = 350       -- on fait apparaitre le vaisseau1
  vaisseau1.y    = 200       -- on fait apparaitre le vaisseau1
end
-- setgamevaisseau fin

-- load debut
function love.load()
  player.number = 1
  setscreen()                     -- definit ecran
  --setvariableforgameship()        -- definir variable du jeu game ship tous a 0
  setgameship1()                   -- definir le joueur et l'affichage du vaisseau

end
-- load fin
-- update debut
function love.update(dt)
  

-- colision rond player 1 debut
  if colision.rond == 1  then
  
  if vaisseau1.y > hauteur then
  vaisseau1.y = 0
  else
  end
  if vaisseau1.y < 0 then
  vaisseau1.y = hauteur
  else
  end
  if vaisseau1.x > largeur then
  vaisseau1.x = 0
  else
  end
  if vaisseau1.x < 0 then
  vaisseau1.x = largeur
  else
  end
  
  end -- colision rond player 1 fin 
-- player.number == 1

-- colision rebond player 2 debut

-- colision rond player 2 debut


-- player control debut
  if player.number == 1 then
  vaisseau1.vy = vaisseau1.vy + 0.001*60*dt
  if love.keyboard.isDown("right") then
    vaisseau1.angle = vaisseau1.angle + 90 * dt
  end
  if love.keyboard.isDown("left") then
    vaisseau1.angle = vaisseau1.angle - 90 * dt
  end
  if love.keyboard.isDown("up") then
    local angle_radians = math.rad(vaisseau1.angle)
    local force_x = math.cos(angle_radians) * (1 * dt)
    local force_y = math.sin(angle_radians) * (1 * dt)
    vaisseau1.vx = vaisseau1.vx + force_x
    vaisseau1.vy = vaisseau1.vy + force_y
    vaisseau1.accelerer = 1
    vaisseau1.showengine = 1
    else
    vaisseau1.showengine = 0
    vaisseau1.accelerer = 0
  end
  vaisseau1.x = vaisseau1.x + vaisseau1.vx
  vaisseau1.y = vaisseau1.y + vaisseau1.vy
  end -- player control fin
--
  -- player 2 control debut
  if player.number == 2 then
          vaisseau2.vy = vaisseau2.vy + 0.001*60*dt
          if love.keyboard.isDown("right") then
          vaisseau2.angle = vaisseau2.angle + 90 * dt
          end
              if love.keyboard.isDown("left") then
              vaisseau2.angle = vaisseau2.angle - 90 * dt
              end
              if love.keyboard.isDown("up") then
              local angle_radians = math.rad(vaisseau2.angle)
              local force_x = math.cos(angle_radians) * (1 * dt)
              local force_y = math.sin(angle_radians) * (1 * dt)
              vaisseau2.vx = vaisseau2.vx + force_x
              vaisseau2.vy = vaisseau2.vy + force_y
              vaisseau2.accelerer = 1
              vaisseau2.showengine = 1
              else
              vaisseau2.showengine = 0
              vaisseau2.accelerer = 0
              end
          vaisseau2.x = vaisseau2.x + vaisseau2.vx
          vaisseau2.y = vaisseau2.y + vaisseau2.vy
          end 
  end



function love.draw()
-- joueur 1 debut
  -- afficher vaisseau 1 debut
  if vaisseau1.showship == 1 then
  love.graphics.draw(vaisseau1.imgship, vaisseau1.x, vaisseau1.y, math.rad(vaisseau1.angle), 1, 1, vaisseau1.imgship:getWidth()/2, vaisseau1.imgship:getHeight()/2)
  else
  end
  -- afficher vaisseau 1 fin
  -- afficher moteur 1 debut
if vaisseau1.showengine == 1 then
love.graphics.draw(vaisseau1.imgengine, vaisseau1.x, vaisseau1.y, math.rad(vaisseau1.angle), 1, 1, vaisseau1.imgengine:getWidth()/2,vaisseau1.imgengine:          getHeight()/2)
else
end
  -- afficher moteur 1 debut
-- joueur 1 fin


end