---
-- Background Class
-- @author debuss-a
--

Background = {}
Background.__index = Background

function Background.new(colors)
    local self = setmetatable({}, Background)

    self.colors = colors or {love.math.random(), love.math.random(), love.math.random()}
    self.signs = {"+", "+", "+"}

    return self
end

function Background.draw(self)
    love.graphics.clear(self.colors)
end

function Background.update(self, dt)
    if self.signs[1] == "+" and self.colors[1] > 1 then
        self.signs[1] = "-"
    elseif self.signs[1] == "-" and self.colors[1] < 0 then
        self.signs[1] = "+"
    end

    if self.signs[2] == "+" and self.colors[2] > 1 then
        self.signs[2] = "-"
    elseif self.signs[2] == "-" and self.colors[2] < 0 then
        self.signs[2] = "+"
    end

    if self.signs[3] == "+" and self.colors[3] > 1 then
        self.signs[3] = "-"
    elseif self.signs[3] == "-" and self.colors[3] < 0 then
        self.signs[3] = "+"
    end

    if self.signs[1] == "+" then
        self.colors[1] = self.colors[1] + dt / 20
    else
        self.colors[1] = self.colors[1] - dt / 20
    end
    if self.signs[2] == "+" then
        self.colors[2] = self.colors[2] + dt / 20
    else
        self.colors[2] = self.colors[2] - dt / 20
    end
    if self.signs[3] == "+" then
        self.colors[3] = self.colors[3] + dt / 20
    else
        self.colors[3] = self.colors[3] - dt / 20
    end
end
