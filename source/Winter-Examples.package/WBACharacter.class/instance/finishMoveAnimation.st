animations
finishMoveAnimation 
	scheduler stopGameTickActionFor: self.
	isMoving := false.
	player movementKeyDown
		ifNil: [ currentFoot := 0 ]
		ifNotNil: [ :dir | self maybeMove: dir ]