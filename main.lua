---
-- @author debuss-a
--

require "background"
require "ball"

function love.load(arg)
    background = Background.new()

    balls = {}
    for i=1, 100 do
        table.insert(
            balls,
            Ball.new(
                nil,
                nil,
                {love.math.random(), love.math.random(), love.math.random(), 1},
                love.math.random(100, 600)
            )
        )
    end
end

function love.draw()
    background:draw()

    for k, ball in pairs(balls) do
        ball:draw()
    end

    love.graphics.reset()
    love.graphics.print("FPS : "..tostring(love.timer.getFPS()), 10, 10)
end

function love.update(dt)
    background:update(dt)

    for k, ball in pairs(balls) do
        ball:update(dt)
    end
end

function love.keyreleased(key)
    if key == "escape" then
        love.event.quit()
    end
end
