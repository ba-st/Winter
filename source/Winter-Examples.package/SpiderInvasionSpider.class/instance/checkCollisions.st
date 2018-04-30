Collisions
checkCollisions

	scene components
		do: [ :component | 
			component = self
				ifFalse: [ component position = self position
						ifTrue: [ (Collision between: self and: component) applyOnGame ] ] ]