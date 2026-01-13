MaquinaEstado = Class{}

function MaquinaEstado:init(estados)
    self.base = {
        render = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end
    }
    self.estados = estados or {}
    self.actual  = self.base
end

function MaquinaEstado:cambiar(nombreEstado, parametrosIniciales)
    assert(self.estados[nombreEstado])
    self.actual:exit()
    self.actual = self.estados[nombreEstado]()
    self.actual:enter(parametrosIniciales)
end

function MaquinaEstado:update(dt)
    self.actual:update(dt)
end

function MaquinaEstado:render()
    self.actual:render()
end