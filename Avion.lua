Avion = Class{}

function Avion:init()
    -- propiedades iniciales
    self.sprite = love.graphics.newImage('Sprites/avion.png')
    self.ancho  = self.sprite:getWidth()
    self.alto   = self.sprite:getHeight()
    -- posicion inicial
    self.x = VIRTUAL_ANCHO / 2 - (self.ancho/ 2)
    self.y = VIRTUAL_ALTO / 2  -  (self.alto/ 2)
end

function Avion:render()
    love.graphics.draw(self.sprite, self.x, self.y)
end