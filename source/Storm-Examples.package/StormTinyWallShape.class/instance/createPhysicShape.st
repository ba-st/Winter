private
createPhysicShape
	^(CmShape 
		newSegmentBody: self scene physicBody
			from: self position 
			to: (self position + self extent)
			radius: 0.0)
		friction: 1.0;
		elasticity: 1.0;
		collisionType: self class defaultCollisionType;
		yourself