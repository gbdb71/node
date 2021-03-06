local BulletExplosion = class("BulletExplosion", Entity)

BulletExplosion.static.TIME = 0.4

function BulletExplosion:initialize(x, y)
	Entity.initialize(self, x, y)

	self.time = BulletExplosion.static.TIME
	self.animation = Animation(Resources.getImage("bullet_explode.png"), 40, 47, self.time/8, false)
end

function BulletExplosion:update(dt)
	self.animation:update(dt)

	self.time = self.time - dt
	if self.time <= 0 then
		self:kill()
	end
end

function BulletExplosion:draw()
	self.animation:draw(self.x, self.y-16)
end

return BulletExplosion
