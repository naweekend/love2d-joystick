# Joystick.lua
Simply copy paste the `joystick.lua` into your project,
and import it in your `main.lua` file:

```lua
local joystick = require("joystick")

function love.load()
    joystick.init({
        mobileOnly = true,
        baseX = 150,
        baseY = love.graphics.getHeight() - 150,
        baseRadius = 100,
        handleX = 150,
        handleY = love.graphics.getHeight() - 150,
        handleRadius = 45,
        baseColor = { 255, 255, 255, 0.3 },
        baseOutlineColor = { 100, 100, 100, 0.4 }, -- {r, g, b, a}
        handleColor = { 255, 255, 255, 0.3 },
        handleOutlineColor = { 100, 100, 100, 0.6 },
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
```

You can customize the joystick options as you like.
The normalized output vector can be obtained using `joystick.getVector()`.

```lua
local x, y = joystick.getVector()
```