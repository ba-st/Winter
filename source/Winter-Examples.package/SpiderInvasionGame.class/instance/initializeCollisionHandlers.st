initialization
initializeCollisionHandlers

	collisionHandlers
		add:
			(CollisionHandler
				between: SpiderInvasionSpider
				and: SpiderInvasionWall
				onCollisionDo: [ :collision | 
					| leftOrRight newSpiderPos |
					leftOrRight := #(-1 1) atRandom.
					newSpiderPos := collision firstComponent position - (0 @ 1) + (leftOrRight @ 0).
					(scene isValidPosition: newSpiderPos)
						ifTrue: [ collision firstComponent position: newSpiderPos ] ])