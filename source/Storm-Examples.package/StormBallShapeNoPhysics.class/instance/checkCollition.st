Collision
checkCollition
	self position x > 620 | (self position x < 0)
		ifTrue: [ xOffset := xOffset negated.
			self collisionSound
				adjustVolumeTo: 20 overMSecs: 100;
				play ].
	self position y > 350 | (self position y < 0)
		ifTrue: [ yOffset := yOffset negated.
			self collisionSound
				adjustVolumeTo: 20 overMSecs: 100;
				play ]