---
-- Ball Class
-- @author debuss-a
--

Ball = {}
Ball.__index = Ball

function Ball.new(x, y, colors, velocity)
    local self = setmetatable({}, Ball)

    -- Coordinates
    self.x = x or love.math.random(0, love.graphics.getWidth())
    self.y = y or love.math.random(0, love.graphics.getHeight())
    self.colors = colors or {1, 1, 1, 1}
    self.velocity = velocity or 300

    -- Directions
    self.sign_x = "+"
    self.sign_y = "+"

    -- Misc
    self.points = {}

    table.insert(self.points, {x = self.x, y = self.y})

    return self
end

function Ball.draw(self)
    love.graphics.setColor(self.colors)
    love.graphics.circle("fill", self.x, self.y, 10, 20)
end

function Ball.update(self, dt)
    local x = self.x
    local y = self.y
    local z = self.velocity * dt
    local rx = love.math.random(5, 20)
    local ry = love.math.random(5, 20)

    -- New positions
    if self.sign_x == "+" then
        x = x + z
    else
        x = x - z
    end

    if self.sign_y == "+" then
        y = y + z
    else
        y = y - z
    end

    -- Checks
    if x > love.graphics.getWidth() then
        self.sign_x = "-"
        x = self.x - z
    elseif x < 0 then
        self.sign_x = "+"
        x = self.x + z
    end

    if y > love.graphics.getHeight() then
        self.sign_y = "-"
        y = self.y - z
    elseif y < 0 then
        self.sign_y = "+"
        y = self.y + z
    end

    -- Set
    self.x = x
    self.y = y
end
