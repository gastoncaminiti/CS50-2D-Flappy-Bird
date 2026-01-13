-- https://github.com/Ulydev/push
push = require "push"
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'class'
-- Importar Clase Avion
require 'Avion'
-- Importar Clase Obstaculo
require 'Obstaculo'
-- Importar Clase Par Obstaculos
require 'ParObstaculos'
-- Importar Clase Maquina Estado
require 'MaquinaEstado'
-- Importar Clase BaseEstado Estado
require 'Estados.BaseEstado'
-- Importar Clase JugarEstado Estado
require 'Estados.JugarEstado'
-- Importar Clase TituloEstado Estado
require 'Estados.TituloEstado'
-- Importar Clase PuntajeEstado Estado
require 'Estados.PuntajeEstado'
-- Definir Resolucion Ventana
VENTANA_ANCHO       = 1280
VENTANA_ALTO        = 720
-- Definir Resolucion Virtual
VIRTUAL_ANCHO       = 768
VIRTUAL_ALTO        = 432
-- Configuracion Parallax
VELOCIDAD_FONDO     = 60
VELOCIDAD_PISO      = 120
LOOP_FONDO          = 800
LOOP_PISO           = 808

local fondo         = love.graphics.newImage('Sprites/fondo.png')
local posicionFondo = 0
local piso          = love.graphics.newImage('Sprites/piso.png')
local posicionPiso  = 0

function love.load()
    -- Configurar Filtro
    love.graphics.setDefaultFilter('linear', 'linear')
    -- Titulo de Ventana
    love.window.setTitle('Tappy Avion')
     -- configurar fuentes
    smallFont = love.graphics.newFont('Fonts/font.ttf', 8)
    mediumFont = love.graphics.newFont('Fonts/flappy.ttf', 14)
    flappyFont = love.graphics.newFont('Fonts/flappy.ttf', 28)
    hugeFont = love.graphics.newFont('Fonts/flappy.ttf', 56)
    love.graphics.setFont(flappyFont)
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

    -- Maquina de Estado de Acceso Global
    MaquinaEstadoGlobal = MaquinaEstado {
        ['titulo'] = function() return TituloEstado() end,
        ['jugar']  = function() return JugarEstado() end,
        ['puntaje'] = function() return PuntajeEstado() end
    }
    -- Configurar Estado Inicial
    MaquinaEstadoGlobal:cambiar('titulo')
    -- Tabla de teclas presionadas
    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- Registrar tecla presionada en Tabla
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

-- Funcion para determinar si una tecla esta presionada
function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    -- Calculo de posicion de fondo y piso
    posicionFondo = (posicionFondo + VELOCIDAD_FONDO * dt) % LOOP_FONDO
    posicionPiso  = (posicionPiso + VELOCIDAD_PISO * dt) % LOOP_PISO
    -- Actualizar estado actual
    MaquinaEstadoGlobal:update(dt)
    -- Reiniciar teclas presionadas en cada frame
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    -- Dibujar fondo
    love.graphics.draw(fondo, -posicionFondo, 0)
    MaquinaEstadoGlobal:render()
    -- Dibujar piso
    love.graphics.draw(piso, -posicionPiso, VIRTUAL_ALTO - 36)
    push:finish()
end
