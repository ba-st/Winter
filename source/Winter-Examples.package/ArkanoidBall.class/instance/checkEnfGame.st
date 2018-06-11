Collisions
checkEnfGame
	self position y > game screen extentY
		ifTrue: [ game resetPlayerAndBall: self ]