Obstaculo = Class{}

local OBSTACULO_SPRITE = love.graphics.newImage("Sprites/obstaculo.png")

OBSTACULO_ANCHO = OBSTACULO_SPRITE:getWidth() 
OBSTACULO_ALTO  = OBSTACULO_SPRITE:getHeight()
OBSTACULO_VELOCIDAD = 60


function Obstaculo:init(orientacion, y)
    self.x = VIRTUAL_ANCHO
    self.y = y
    self.ancho = OBSTACULO_ANCHO 
    self.alto  = OBSTACULO_ALTO
    self.orientacion = orientacion
end

function Obstaculo:update(dt)
    
end

function Obstaculo:render()
    love.graphics.draw(OBSTACULO_SPRITE, self.x,
        (self.orientacion == 'arriba' and self.y + OBSTACULO_ALTO or self.y),
        0, 1, self.orientacion == 'arriba' and -1 or 1)
end