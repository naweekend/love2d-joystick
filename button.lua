Button = {}

function Button.init()
    Button.x = love.graphics.getWidth() / 2
    Button.y = love.graphics.getHeight() / 2
    Button.radius = 50
    Button.isSelected = false
end

function Button.draw()
    love.graphics.circle("fill", Button.x, Button.y, Button.radius)
end

function Button.mousepressed(x, y, button, istouch)
    if button == 1 then
        if DistanceTo(x, y, Button.x, Button.y) < Button.radius then
            print("Button clicked")
            Button.isSelected = true
        end
    end
end

function Button.mousemoved(x, y, dx, dy, istouch)
    if Button.isSelected then
        Button.x = x
        Button.y = y
    end
end

function Button.mousereleased(x, y, button, istouch)
    if button == 1 then
        if Button.isSelected then
            Button.isSelected = false
            print("Button released")
        end
    end
end

function DistanceTo(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

return Button
