local joystick = require("joystick")

function love.load()
    joystick.init({
        -- mobileOnly = true
    })
end

function love.update(dt)
    print(joystick.getVector())
end

function love.draw()
    love.graphics.setBackgroundColor(0.7, 0.6, 0.5)
    joystick.draw()
end

function love.touchpressed(id, x, y, dx, dy)
    joystick.touchpressed(id, x, y, dx, dy)
end

function love.mousepressed(x, y, button, istouch)
    joystick.mousepressed(x, y, button, istouch)
end

function love.touchmoved(id, x, y, dx, dy)
    joystick.touchmoved(id, x, y, dx, dy)
end

function love.mousemoved(x, y, dx, dy, istouch)
    joystick.mousemoved(x, y, dx, dy, istouch)
end

function love.touchreleased(id, x, y, dx, dy)
    joystick.touchreleased(id, x, y, dx, dy)
end

function love.mousereleased(x, y, button, istouch)
    joystick.mousereleased(x, y, button, istouch)
end
