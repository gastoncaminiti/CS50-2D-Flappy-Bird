Obstaculo = Class{}

local OBSTACULO_SPRITE = love.graphics.newImage("Sprites/obstaculo.png")
local OBSTACULO_VELOCIDAD = -60

function Obstaculo:init()
    self.x = VIRTUAL_ANCHO
    self.y = math.random(VIRTUAL_ALTO - OBSTACULO_SPRITE:getHeight() / 4 , VIRTUAL_ALTO/2 )
    self.ancho = OBSTACULO_SPRITE:getWidth() 
end

function Obstaculo:update(dt)
    self.x = self.x + OBSTACULO_VELOCIDAD * dt
end

function Obstaculo:render()
    love.graphics.draw(OBSTACULO_SPRITE, math.floor(self.x + 0.5), math.floor(self.y))
end