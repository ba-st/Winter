events
eventUpdated: anEvent
	ballsGenerated = self balls ifTrue: [ ^self ].
	
	stepCounter % 10 = 0
		ifTrue: [  
			anEvent scene 
				addComponents: ((1 to: ballsPerStep) collect: [ :i | 
					self createBallShape
						position: (self startX + 5 atRandom)@(20 - (30 * i)) ]).
			ballsGenerated := ballsGenerated + ballsPerStep.
			ballsGenerated = self balls 
				ifTrue: [ 
					anEvent scene
						addComponent: (self createHeavyBallShape 
							position: self startX - (StormHeavyBallShape defaultRadius / 2) @ -1000) ] ].
	stepCounter := stepCounter + 1.