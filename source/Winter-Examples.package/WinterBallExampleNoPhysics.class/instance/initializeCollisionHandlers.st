Initialization
initializeCollisionHandlers
	collisionHandlers
		add:
			(CollisionHandler
				between: WinterBallShapeNoPhysics
				and: WinterGameWindow
				onCollisionDo: [ :collision | 
					collision firstComponent
						perform: (#negate , collision axisSymbol asUppercase) asSymbol;
						playCollisionSound ]);
		add:
			(CollisionHandler
				between: WinterContainerBoxShapeNoPhysics
				and: WinterBallShapeNoPhysics
				onCollisionDo: [ :collision | 
					collision firstComponent
						negateX;
						negateY;
						playCollisionSound ])