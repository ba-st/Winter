private
createPhysicShape
	^(CmShape 
		newSegmentBody: self scene physicSpace staticBody 
			from: self position 
			to: self position + self extent
			radius: 0.0)
		friction: 1.0;
		collisionType: self class defaultCollisionType;
		yourself