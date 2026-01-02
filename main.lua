-- https://github.com/Ulydev/push
push = require "push"

-- Definir Resolucion Ventana
VENTANA_ANCHO = 1280
VENTANA_ALTO  = 720
-- Definir Resolucion Virtual
VIRTUAL_ANCHO = 768
VIRTUAL_ALTO  = 432

-- Configuracion Parallax
posicionFondo = 0
posicionPiso = 0
VELOCIDAD_FONDO = 60
VELOCIDAD_PISO  = 120
LOOP_FONDO = 800
LOOP_PISO  = 808

function love.load()
    -- Configurar Filtro
    love.graphics.setDefaultFilter('linear', 'linear')
    -- Titulo de Ventana
    love.window.setTitle('Tappy Avion')
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

function love.update(dt)
    -- Calculo de posicion de fondo y piso
    posicionFondo = (posicionFondo + VELOCIDAD_FONDO * dt) % LOOP_FONDO
    posicionPiso  = (posicionPiso  +  VELOCIDAD_PISO * dt) % LOOP_PISO
end

function love.draw()
    push:start()
    -- Dibujar fondo
    love.graphics.draw(fondo, -posicionFondo, 0)
    -- Dibujar piso
    love.graphics.draw(piso,  -posicionPiso, VIRTUAL_ALTO - 36)
    push:finish()
end