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
    -- Acumular puntaje
    self.puntaje = 0
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
        if not obstaculo.scored then
            -- Sumar puntaje si superamos obstaculo
            if obstaculo.x + OBSTACULO_ANCHO < self.avion.x then
                self.puntaje = self.puntaje + 1
                obstaculo.scored = true
            end
        end
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
    -- Determinar colision entre partes de cada obstaculo y avion
    for k, obstaculo in pairs(self.obstaculos) do
        for l, parte in pairs(obstaculo.par) do
            if self.avion:colision(parte) then
                MaquinaEstadoGlobal:cambiar('puntaje', {
                    score = self.puntaje
                })
            end
        end
    end
    -- Reiniciar si tocamos el piso
    if self.avion.y > VENTANA_ALTO - 15 then
        MaquinaEstadoGlobal:cambiar('puntaje', {
            score = self.puntaje
        })
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
