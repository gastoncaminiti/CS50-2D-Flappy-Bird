-- https://github.com/Ulydev/push
push = require "push"

-- Definir Resolucion Ventana
VENTANA_ANCHO = 1280
VENTANA_ALTO  = 720
-- Definir Resolucion Virtual
VIRTUAL_ANCHO = 800 
VIRTUAL_ALTO  = 480

function love.load()
    -- Configurar Filtro
    love.graphics.setDefaultFilter('linear', 'linear')
    -- Titulo de Ventana
    love.window.setTitle('Clone Fifty Bird')
    -- Definir Sprites
    fondo = love.graphics.newImage('Sprites/fondo.png')
    piso  = love.graphics.newImage('Sprites/piso.png')
    -- Configurar Ventana
    push:setupScreen(
        VIRTUAL_ANCHO,
        VIRTUAL_ALTO,
        VENTANA_ANCHO, 
        VENTANA_ALTO, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()
    -- Dibujar fondo
    love.graphics.draw(fondo, 0, 0)
    -- Dibujar piso
    love.graphics.draw(piso, 0, VIRTUAL_ALTO - 71)
    push:finish()
end