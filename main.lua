local joystick = require("joystick")

function love.load()
    joystick.init()
end

function love.update(dt)

end

function love.draw()
    love.graphics.setBackgroundColor(0.7, 0.6, 0.5)
    joystick.draw()
end
