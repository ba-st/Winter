accessing
adjustPositionToRemainInScreen 
	self position x > (self scene dimensions x - self realExtent x) 
		ifTrue: [ 
			self position: (self scene dimensions x - self realExtent x)@self position y. 
			self delta: self delta negated ].
	self position x < 0 
		ifTrue: [ 
			self position: 0@self position y. 
			self delta: self delta negated ]