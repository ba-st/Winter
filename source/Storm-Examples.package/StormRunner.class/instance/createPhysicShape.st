private
createPhysicShape
	^(CmShape newBoxBody: self physicBody extent: self extent)
		friction: 1.0;
		elasticity: 0.2;
		yourself.