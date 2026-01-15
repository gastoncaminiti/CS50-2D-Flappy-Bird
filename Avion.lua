Avion = Class {}

local GRAVITY = 15
local AABB_OFFSET = 54

function Avion:init()
    -- propiedades iniciales
    self.sprite = love.graphics.newImage('Sprites/avion.png')
    self.ancho  = self.sprite:getWidth()
    self.alto   = self.sprite:getHeight()
    -- posicion inicial
    self.x      = VIRTUAL_ANCHO / 2 - (self.ancho / 2)
    self.y      = VIRTUAL_ALTO / 2 - (self.alto / 2)
    -- velocidad agregada en y
    self.dy     = 0
end

function Avion:update(dt)
    -- calcular velocidad en y
    self.dy = self.dy + GRAVITY * dt
    -- if input restar velocidad en y
    if love.keyboard.wasPressed('space') then
        self.dy = -3
        sonidos['saltar']:play()
    end
    -- aplicar velocidad a y
    self.y = self.y + self.dy
end

function Avion:colision(obstaculo)
    if (self.x + 2) + (self.ancho - 4) >= obstaculo.x + AABB_OFFSET and self.x + 2 <= obstaculo.x + OBSTACULO_ANCHO - AABB_OFFSET then
        if (self.y + 2) + (self.alto - 4) >= obstaculo.y and self.y + 2 <= obstaculo.y + OBSTACULO_ALTO then
            return true
        end
    end
    return false
end

function Avion:render()
    love.graphics.draw(self.sprite, self.x, self.y)
end