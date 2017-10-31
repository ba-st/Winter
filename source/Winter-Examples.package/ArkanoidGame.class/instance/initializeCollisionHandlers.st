Initialization
initializeCollisionHandlers

	collisionHandlers
		add:
			(CollisionHandler
				between: ArkanoidPlayer
				and: WinterGameWindow
				onCollisionDo: [ :collision | 
					collision firstComponent positionX = 10 negated
						ifTrue: [ collision firstComponent moveRight ]
						ifFalse: [ collision firstComponent moveLeft ] ]);
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidWall
				onCollisionDo: [ :collision | 
					collision secondComponent isHorizontal
						ifTrue: [ collision firstComponent negateY ]
						ifFalse: [ collision firstComponent negateX ].
					collision firstComponent playCollisionSound ]);
		"add:
			(CollisionHandler
				between: ArkanoidBall
				and: WinterGameWindow
				onCollisionDo: [ :collision | 
					collision firstComponent position y > window playableExtentY
						ifTrue: [ self resetPlayerAndBall: collision firstComponent ]
						ifFalse: [ collision firstComponent
								perform: (#negate , collision axisSymbol asUppercase) asSymbol;
								playCollisionSound ] ]);"
			add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidPlayer
				onCollisionDo: [ :collision | 
					collision firstComponent
						negateY;
						playCollisionSound ])