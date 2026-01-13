JugarEstado = Class { __includes = BaseEstado }

function JugarEstado:init()
    -- Instanciar Avion
    self.avion = Avion()
    -- Tabla de Obstaculos
    self.obstaculos = {}
    -- Timer
    self.timer = 0
    -- Ultimo valor Y registrado para la ubicación de obstaculo
    self.ultimoY = -OBSTACULO_ALTO + math.random(80) + 100
end

function JugarEstado:update(dt)
    -- Incrementar timer
    self.timer = self.timer + dt
    -- Si pasaron 2 segundos
    if self.timer > 2 then
        local y = math.max(-OBSTACULO_ALTO + 10,
            math.min(self.ultimoY + math.random(-20, 20),
                VIRTUAL_ALTO - 90 - OBSTACULO_ALTO))
        self.ultimoY = y
        -- Insertar nuevo para de obstaculos en la tabla
        table.insert(self.obstaculos, ParObstaculos(y))
        self.timer = 0
    end
    -- Actualizar Obstaculos con For
    for k, obstaculo in pairs(self.obstaculos) do
        obstaculo:update(dt)
    end
    -- Eliminar Obstaculos
    for k, obstaculo in pairs(self.obstaculos) do
        if obstaculo.remove then
            table.remove(self.obstaculos, k)
        end
    end
    -- Actualizar Avion
    self.avion:update(dt)
     -- simple collision between bird and all pipes in pairs
    for k, obstaculo in pairs(self.obstaculos) do
        for l, parte in pairs(obstaculo.par) do
            if self.avion:colision(parte) then
                MaquinaEstadoGlobal:cambiar('titulo')
            end
        end
    end
end

function JugarEstado:render()
    -- Dibujar obstaculos
    for k, obstaculo in pairs(self.obstaculos) do
        obstaculo:render()
    end
    -- Dibujar avion
    self.avion:render()
end