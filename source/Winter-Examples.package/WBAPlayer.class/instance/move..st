navigation
move: anIndexDirection

	character isMoving
		ifTrue: [ "already moves" ]
		ifFalse: [ character isMoving: true.
			currentFoot := 1.
			game scheduler
				newGameTickAction:
					(WBACharacterMoveAnimation new
						character: character ;
						direction: anIndexDirection;
						yourself)
				for: character ]