local scale = 1.8

function love.conf(t)
    t.window.title = "Love Mouse Drag Test"
    -- t.window.width = 1920 / scale
    -- t.window.height = 1080 / scale
    t.window.width = 0
    t.window.height = 0
    -- t.window.resizable = true
    t.window.fullscreen = true
end
