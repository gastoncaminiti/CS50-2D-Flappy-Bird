-- https://github.com/Ulydev/push
push = require "push"

function love.load()
    love.window.setTitle('Clone Fifty Bird')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()

end