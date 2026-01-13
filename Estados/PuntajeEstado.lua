PuntajeEstado = Class{__includes = BaseEstado}

function PuntajeEstado:enter(parametros)
    self.puntaje = parametros.score
end

function PuntajeEstado:update(dt)
    -- Cambiar a estado jugar
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        MaquinaEstadoGlobal:cambiar('jugar')
    end
end

function PuntajeEstado:render()
    -- Dibujar ventana de estado
    love.graphics.setColor(0,0,0.25,0.5)
    
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Over', 0, 64, VIRTUAL_ANCHO, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Puntaje: ' .. tostring(self.puntaje), 0, 100, VIRTUAL_ANCHO, 'center')

    love.graphics.printf('Presionar Enter para jugar de nuevo!', 0, 160, VIRTUAL_ANCHO, 'center')
end