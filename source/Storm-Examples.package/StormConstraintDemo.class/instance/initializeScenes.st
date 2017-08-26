initialization
initializeScenes
	| storm balls constraint aBody anotherbody |
	balls :=  self createBallShapes.
	aBody := ((balls at: 1) physicBody).
	anotherbody := ((balls at: 2) physicBody).
		"constraint := CmExternalConstraint newPinJoint: ((balls at: 1) physicBody) 
			with: ((balls at: 2) physicBody)  
			anchor:  (CmVector x: 0.0 y: 0.0) 
			andAnchor2:  (CmVector x: 7.0 y: 7.0) ."
	
		"constraint  := CmExternalConstraint  newPivotJoint: ((balls at: 1) physicBody)  with: ((balls at: 2) physicBody)  joinedTo: (CmVector x: 35.0 y: 20.0)."
		constraint  := CmExternalConstraint  newSlideJoint: aBody with: anotherbody anchor1:  (CmVector x: 0.0 y: 0.0) anchor2: (CmVector x: 0.0 y: 0.0) min: 40.0 max: 80.0.
	

		storm := Storm2DScene new. 
		storm backgroundColor: Color black.
		storm addComponents: balls.
		storm addComponents: self createWallShapes.
		storm addComponent: (StormSlideJointComponent for: constraint).
		
		storm physicSpace addConstraint: constraint.
		self addScene:  storm.
	