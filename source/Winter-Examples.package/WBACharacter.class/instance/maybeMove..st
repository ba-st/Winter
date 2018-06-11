animations
maybeMove: index
	isMoving ifTrue: [ "already moves" ^ self ].
	direction := index. 
	(cell neighbours at: index) element allowMovement ifFalse: [ ^ currentFoot := 0 ].
	self move: index