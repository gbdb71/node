local Enemy = require("Enemy")

local Spider = class("Spider", Enemy)

Spider.static.MASS = 30
Spider.static.SOLID = false

function Spider:initialize(x, y)
	Enemy.initialize(self, x, y, 0, Spider.static.MASS, Spider.static.SOLID)

	self.animator = Animator(Resources.getAnimator("spider.lua"))
end

function Spider:update(dt)
	self.animator:update(dt)

	if self:isLinked() == false and Mouse.wasPressed("l") then
		local mx, my = Mouse.getPositionCamera()
		if mx >= self.x - 16 and mx <= self.x + 16
		and my >= self.y - 32 and my <= self.y then
			self:setLinked()
			local link = self.scene:find("link")
			link:addLink(self)
		end
	end
end

function Spider:draw()
	self.animator:draw(self.x, self.y, 0, 1, 1, 16, 32)
end

return Spider
