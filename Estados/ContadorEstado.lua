ContadorEstado = Class { __includes = BaseEstado }

CONTADOR_TIEMPO = 0.75

function ContadorEstado:init()
    self.cuenta = 3
    self.tiempo = 0
end

function ContadorEstado:update(dt)

    self.tiempo = self.tiempo + dt

    if self.tiempo > CONTADOR_TIEMPO then
        self.tiempo = self.tiempo % CONTADOR_TIEMPO 
        self.cuenta = self.cuenta - 1

        if self.cuenta == 0 then
            MaquinaEstadoGlobal:cambiar('jugar')
        end
    end
end

function ContadorEstado:render()
    love.graphics.setColor(0,0,0.25,0.5)
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.cuenta), 0, 120, VIRTUAL_ANCHO, 'center')
end