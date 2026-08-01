Joystick = {}

function Joystick.init()
    -- base
    Joystick.baseX = love.graphics.getWidth() / 2
    Joystick.baseY = love.graphics.getHeight() / 2
    Joystick.baseRadius = 80

    -- handle
    Joystick.handleX = love.graphics.getWidth() / 2
    Joystick.handleY = love.graphics.getHeight() / 2
    Joystick.handleRadius = 35

    Joystick.isSelected = false
    Joystick.activeTouchId = nil
end

function Joystick.draw()
    -- draw the base and its outline
    SetColor(255, 255, 255, 0.3)
    love.graphics.circle("fill", Joystick.baseX, Joystick.baseY, Joystick.baseRadius)
    SetColor(0, 0, 0, 0.2)
    love.graphics.circle("line", Joystick.baseX, Joystick.baseY, Joystick.baseRadius)

    -- draw the handle and its outline
    SetColor(255, 255, 255, 0.6)
    love.graphics.circle("fill", Joystick.handleX, Joystick.handleY, Joystick.handleRadius)
    SetColor(0, 0, 0, 0.3)
    love.graphics.circle("line", Joystick.handleX, Joystick.handleY, Joystick.handleRadius)
end

function love.touchpressed(id, x, y, dx, dy)
    if id then Joystick.activeTouchId = id end
    if DistanceTo(x, y, Joystick.baseX, Joystick.baseY) < Joystick.baseRadius then
        Joystick.isSelected = true
        print("Joystick selected")
    end
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        love.touchpressed("mouse", x, y)
    end
end

function love.touchmoved(id, x, y, dx, dy)
    if Joystick.isSelected and Joystick.activeTouchId and Joystick.activeTouchId == id then
        local distX = x - Joystick.baseX
        local distY = y - Joystick.baseY
        print(Joystick.getVector())

        if DistanceTo(x, y, Joystick.baseX, Joystick.baseY) <= Joystick.baseRadius then
            Joystick.handleX = x
            Joystick.handleY = y
        else
            local angle = math.atan2(distY, distX) -- two-argument atan = atan2
            Joystick.handleX = Joystick.baseX + Joystick.baseRadius * math.cos(angle)
            Joystick.handleY = Joystick.baseY + Joystick.baseRadius * math.sin(angle)
        end
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    love.touchmoved("mouse", x, y, dx, dy)
end

function love.touchreleased(id, x, y, dx, dy)
    if Joystick.isSelected and Joystick.activeTouchId and Joystick.activeTouchId == id then
        Joystick.isSelected = false
        Joystick.activeTouchId = nil
        Joystick.handleX = Joystick.baseX
        Joystick.handleY = Joystick.baseY
        print("Joystick released")
    end
end

function love.mousereleased(x, y, button, istouch)
    if button == 1 then
        love.touchreleased("mouse", x, y)
    end
end

function Joystick.getVector()
    local dx = Joystick.handleX - Joystick.baseX
    local dy = Joystick.handleY - Joystick.baseY

    -- normalize to -1..1 range based on how far the handle has traveled
    local vx = dx / Joystick.baseRadius
    local vy = dy / Joystick.baseRadius


    local deadzone = 0.15
    if math.abs(vx) < deadzone then
        vx = 0
    end
    if math.abs(vy) < deadzone then
        vy = 0
    end

    local magnitude = math.sqrt(vx ^ 2 + vy ^ 2)

    if magnitude > 1 then
        vx, vy = vx / magnitude, vy / magnitude
    end

    return vx, vy
end

-- helper functions
function SetColor(r, g, b, a)
    love.graphics.setColor(r / 255, g / 255, b / 255, a)
end

function DistanceTo(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function RadianToDegree(angle)
    return angle * (180 / math.pi)
end

return Joystick
