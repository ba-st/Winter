initialization
initializeScenes
	| colors |
	colors := self class ballColors.
	
	self addScene: (Storm2DScene new
		backgroundColor: Color black;
		addComponents: self createWallShapes;
		addComponents:
				((1 to: 5) collect: [ :i | 
						self createBallShape
							color: (colors at: i);
							position: 10 @ (10 - (60 * i)) ]);
							yourself).
	self initializeCallbacks