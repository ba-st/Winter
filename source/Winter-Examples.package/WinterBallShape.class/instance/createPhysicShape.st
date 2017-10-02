private
createPhysicShape
	^(CmShape 
		newCircleBody: self physicBody
			radius: self radius asFloat
			offset: 0@0)
		friction: 0.012;
		elasticity: 0.6;
		collisionType: 1;
		yourself.