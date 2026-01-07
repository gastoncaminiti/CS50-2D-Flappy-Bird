ParObstaculos = Class{}

local ESPACIO_OBSTACULOS = 90

function ParObstaculos:init(y)
    -- Coordenadas iniciales
    self.x = VIRTUAL_ANCHO + 32
    self.y = y
    -- Instanciar dos obstaculos
    self.par = 
    {
        ['arriba'] = Obstaculo('arriba', self.y),
        ['abajo']  = Obstaculo('abajo', self.y + OBSTACULO_ALTO + ESPACIO_OBSTACULOS)
    }

    self.remove = false
end

function ParObstaculos:update(dt)
    -- Avanzar par de obstaculos. Eliminar si estan en borde izquierdo 
    if self.x > -OBSTACULO_ANCHO then
        self.x = self.x - OBSTACULO_VELOCIDAD * dt
        self.par['arriba'].x = self.x
        self.par['abajo'].x  = self.x
    else
        self.remove = true
    end
end

function ParObstaculos:render()
    for k, obstaculo in pairs(self.par) do
        obstaculo:render()
    end
end