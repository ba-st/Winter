initialization
initializeCollisionHandlers
	collisionHandlers
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidWall
				onCollisionDo: [ :collision | 
					collision secondComponent isHorizontal
						ifTrue: [ collision firstComponent negateY ]
						ifFalse: [ collision firstComponent negateX ].
					collision firstComponent playCollisionSound ]);
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidBlock
				onCollisionDo: [ :collision | 
					collision secondComponent collidedByBall.
					collision firstComponent negateY.
					collision firstComponent playCollisionSound ]);
		add:
			(CollisionHandler
				between: ArkanoidPlayer
				and: WinterScreen
				onCollisionDo: [ :collision | 
					collision firstComponent positionX = 10 negated
						ifTrue: [ collision firstComponent moveRight ]
						ifFalse: [ collision firstComponent moveLeft ] ]);
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidPlayer
				onCollisionDo: [ :collision | 
					collision firstComponent
						negateY;
						playCollisionSound ])