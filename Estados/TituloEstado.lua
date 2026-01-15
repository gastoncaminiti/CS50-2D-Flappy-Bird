TituloEstado = Class { __includes = BaseEstado }

function TituloEstado:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        MaquinaEstadoGlobal:cambiar('contador')
    end
end

function TituloEstado:render()
    love.graphics.setColor(0,0,0.25,0.5)
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Tappy Avion', 0, 64, VIRTUAL_ANCHO, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Presionar Enter', 0, 100, VIRTUAL_ANCHO, 'center')
end